import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SurveyProvider extends ChangeNotifier {
  final List<int> _answers = List.filled(6, 0);
  bool _hasCompletedSurvey = false;

  SurveyProvider() {
    _loadSurveyStatus();
  }

  List<int> getAnswers() => _answers;

  // New method to get a specific answer
  int getAnswer(int index) => _answers[index];

  void setAnswer(int index, int value) {
    _answers[index] = value;
    notifyListeners();
  }

  bool get hasCompletedSurvey => _hasCompletedSurvey;

  void completeSurvey() async {
    _hasCompletedSurvey = true;
    notifyListeners();
    // Save the status to SharedPreferences
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool('hasCompletedSurvey', true);
  }

  Future<void> _loadSurveyStatus() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    _hasCompletedSurvey = prefs.getBool('hasCompletedSurvey') ?? false;
    notifyListeners();
  }
}
