import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent_bottom_nav_bar.dart';
import 'package:provider/provider.dart';
import 'package:smartcents/providers/survey_provider.dart';
import 'package:smartcents/screens/courses.dart';

class SurveyScreen extends StatelessWidget {
  final List<String> _questions = [
    'Financial Planning',
    'Budget & Savings',
    'Frugal Living',
    'Understanding Taxes',
    'Investment Basics',
    'Debt Management',
  ];

  SurveyScreen({super.key});

  bool _areAllQuestionsAnswered(BuildContext context) {
    return context
        .read<SurveyProvider>()
        .getAnswers()
        .every((answer) => answer != 0);
  }

  void _submitSurvey(BuildContext context) async {
    if (_areAllQuestionsAnswered(context)) {
      final surveyAnswers =
          context.read<SurveyProvider>().getAnswers(); // Get answers
      debugPrint('Survey answers: $surveyAnswers'); // Print the answers

      // Predict a course using the survey answers
      final predictedCourse =
          await context.read<SurveyProvider>().predictAndStoreCourse();
      debugPrint('Predicted Course: $predictedCourse'); // Print the prediction

      // Show prediction in a dialog
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: const Text('Recommended Course'),
          content: Text(predictedCourse
              .join(', ')), // Ensure predictedCourse is a List<String>
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
                context.read<SurveyProvider>().completeSurvey();
              },
              child: const Text('OK'),
            ),
          ],
        ),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
            content: Text('Please answer all questions before submitting.')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Recommendation Survey'),
      ),
      body: ListView.builder(
        itemCount: _questions.length,
        itemBuilder: (context, index) {
          return Padding(
            padding:
                const EdgeInsets.symmetric(vertical: 8.0, horizontal: 12.0),
            child: Card(
              elevation: 2,
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      _questions[index],
                      style: const TextStyle(
                          fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 8),
                    RatingOptions(index: index),
                  ],
                ),
              ),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _submitSurvey(context),
        child: const Icon(Icons.check),
      ),
    );
  }
}

class RatingOptions extends StatelessWidget {
  final int index;

  const RatingOptions({super.key, required this.index});

  @override
  Widget build(BuildContext context) {
    return Consumer<SurveyProvider>(
      builder: (context, surveyProvider, child) {
        return Column(
          children: List.generate(5, (i) {
            return RadioListTile<int>(
              title: Text('${i + 1}'),
              value: i + 1,
              groupValue: surveyProvider.getAnswer(index),
              onChanged: (int? value) =>
                  value != null ? surveyProvider.setAnswer(index, value) : null,
            );
          }),
        );
      },
    );
  }
}
