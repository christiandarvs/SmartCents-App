import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:smartcents/providers/survey_provider.dart';

import 'package:smartcents/widgets/balance_card.dart';
import 'package:smartcents/widgets/transaction_card.dart';

class Dashboard extends StatelessWidget {
  const Dashboard({super.key});

  @override
  Widget build(BuildContext context) {
    final hasCompletedSurvey =
        context.watch<SurveyProvider>().hasCompletedSurvey;
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Dashboard'),
        ),
        body: Column(
          children: [
            const BalanceCard(),
            const TransactionCard(),
            const SizedBox(
              height: 10,
            ),
            hasCompletedSurvey
                ? const Text('Done na pi')
                : Column(
                    children: [
                      const Text(
                          'Interested in personalized course recommendations?'),
                      TextButton(
                          onPressed: () {},
                          child: const Text('Take our survey!')),
                    ],
                  )
          ],
        ),
      ),
    );
  }
}
