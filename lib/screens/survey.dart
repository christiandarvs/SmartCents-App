import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:smartcents/providers/survey_provider.dart';

class SurveyScreen extends StatelessWidget {
  final List<String> _questions = [
    'I know what Financial Planning is.',
    'I know what Budget & Savings is.',
    'I follow a frugal lifestyle.',
    'I know how taxes work.',
    'I know how investments work.',
    'I pay my bills on time.',
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
      final surveyAnswers = context.read<SurveyProvider>().getAnswers();
      debugPrint('Survey answers: $surveyAnswers');

      final predictedCourse =
          await context.read<SurveyProvider>().predictAndStoreCourse();

      if (!context.mounted) return;

      debugPrint('Predicted Course: $predictedCourse');

      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: const Text('Recommended Course'),
          content: Text(predictedCourse.join(', ')),
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
      if (!context.mounted) return;

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          showCloseIcon: true,
          behavior: SnackBarBehavior.floating,
          duration: Duration(seconds: 4),
          content: Text('Please answer all questions before submitting.'),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Recommendation Survey'),
      ),
      body: Scrollbar(
        // Add Scrollbar here
        thickness: 10,
        thumbVisibility: true, // Makes the scrollbar always visible
        child: ListView.builder(
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
            int rating = 5 - i; // Generate ratings in decreasing order
            return RadioListTile<int>(
              title: Text('$rating'),
              value: rating,
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
