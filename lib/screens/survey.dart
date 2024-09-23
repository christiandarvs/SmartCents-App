import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:smartcents/constants/colors.dart';
import 'package:smartcents/providers/survey_provider.dart';
import 'package:smartcents/screens/courses.dart';

class SurveyScreen extends StatelessWidget {
  final List<String> _questions = [
    'I know what is Financial Planning.',
    'I set financial goals and objectives in my life.',
    'How likely are you to recommend us to a friend?',
    'How easy was it to use our app?',
    'How satisfied are you with our pricing?',
    'How would you rate our overall experience?',
  ];

  SurveyScreen({super.key});

  bool _areAllQuestionsAnswered(BuildContext context) {
    return context
        .read<SurveyProvider>()
        .getAnswers()
        .every((answer) => answer != 0);
  }

  void _submitSurvey(BuildContext context) {
    if (_areAllQuestionsAnswered(context)) {
      final surveyAnswers =
          context.read<SurveyProvider>().getAnswers(); // Get answers
      debugPrint('Survey answers: $surveyAnswers'); // Print the answers
      context.read<SurveyProvider>().completeSurvey();
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const Courses()),
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
        backgroundColor: AppColors.primaryColor,
        title: const Text(
          'Recommendation Survey',
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
        ),
      ),
      body: ListView.builder(
        itemCount: _questions.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  _questions[index],
                  style: const TextStyle(
                      fontSize: 18, fontWeight: FontWeight.bold),
                ),
                RatingOptions(index: index),
              ],
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
