import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:smartcents/models/svc.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class SurveyProvider extends ChangeNotifier {
  final List<int> _answers = List.filled(6, 0);
  bool _hasCompletedSurvey = false;
  final SVMModel _svmModel = SVMModel(); // Instance of the SVM model
  Database? _database;
  List<String> _predictedCourses = []; // To hold the predicted courses

  SurveyProvider() {
    _loadSurveyStatus();
    _svmModel.loadModel(); // Load the SVM model when initializing the provider
    _initDatabase(); // Initialize the database when the provider is created
  }

  // Initialize SQLite database
  Future<void> _initDatabase() async {
    String path = await getDatabasesPath();
    String dbPath = join(path, 'survey.db');

    _database = await openDatabase(
      dbPath,
      version: 1,
      onCreate: (db, version) async {
        await db.execute('''
          CREATE TABLE courses (
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            name TEXT
          )
        ''');
      },
    );
  }

  // Load survey status and recommended courses if completed
  Future<void> _loadSurveyStatus() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    _hasCompletedSurvey = prefs.getBool('hasCompletedSurvey') ?? false;

    if (_hasCompletedSurvey) {
      // Load previously recommended courses if survey was completed
      _predictedCourses = await getRecommendedCourses();
    }

    notifyListeners();
  }

  // Insert recommended courses into the database
  Future<void> _storeRecommendedCourses(List<String> courses) async {
    if (_database != null) {
      // Clear previous courses before inserting new ones
      await _database!.delete('courses');

      Batch batch = _database!.batch();
      for (String course in courses) {
        batch.insert('courses', {'name': course});
      }
      await batch.commit();
    }
  }

  // Get recommended courses from the database
  Future<List<String>> getRecommendedCourses() async {
    if (_database == null) return [];

    List<Map<String, dynamic>> results = await _database!.query('courses');
    return results.map((row) => row['name'] as String).toList();
  }

  // Method to retrieve predicted courses
  List<String> getPredictedCourses() => _predictedCourses;

  List<int> getAnswers() => _answers;

  int getAnswer(int index) => _answers[index];

  void setAnswer(int index, int value) {
    _answers[index] = value;
    notifyListeners();
  }

  bool get hasCompletedSurvey => _hasCompletedSurvey;

  Future<void> completeSurvey() async {
    _hasCompletedSurvey = true;
    notifyListeners();
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool('hasCompletedSurvey', true);
  }

  // New method to predict a course based on survey answers
  Future<List<String>> predictAndStoreCourse() async {
    List<double> inputs = _answers.map((answer) => answer.toDouble()).toList();
    String pred = _svmModel.predict(inputs);

    // Assuming 'pred' is a string of comma-separated values
    List<String> predictions = pred.split(',');

    // Store the predicted courses in the database
    await _storeRecommendedCourses(predictions);

    // Update the predicted courses in the provider
    _predictedCourses = predictions;

    // Return the predicted courses
    return predictions;
  }
}
