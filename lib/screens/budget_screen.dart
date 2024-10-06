import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:smartcents/screens/no_budget_data.dart';

class BudgetScreen extends StatefulWidget {
  const BudgetScreen({super.key});

  @override
  _BudgetScreenState createState() => _BudgetScreenState();
}

class _BudgetScreenState extends State<BudgetScreen> {
  // Predefined values for the pie chart
  final List<Map<String, dynamic>> budgetItems = [
    {'name': 'Food', 'amount': 500},
    {'name': 'Transport', 'amount': 300},
    {'name': 'Entertainment', 'amount': 200},
    {'name': 'Utilities', 'amount': 100},
    {'name': 'Health', 'amount': 150},
  ];

  bool hasNoData = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Budget Tracker'),
      ),
      body: hasNoData
          ? const NoBudgetDataScreen()
          : Column(
              children: [
                const SizedBox(height: 20),

                const SizedBox(height: 20),
                // Pie chart for budget distribution
                Expanded(
                  child: PieChart(
                    PieChartData(
                      sections: _buildPieChartSections(),
                      centerSpaceRadius: 50,
                      sectionsSpace: 2,
                    ),
                  ),
                ),
                const SizedBox(height: 20),
              ],
            ),
    );
  }

  List<PieChartSectionData> _buildPieChartSections() {
    final totalBudget =
        budgetItems.fold(0, (sum, item) => item['amount'] + sum);

    return budgetItems.map((item) {
      final percentage = (item['amount'] / totalBudget) * 100;
      return PieChartSectionData(
        value: item['amount'].toDouble(),
        color: _getColorForCategory(item['name']),
        title: '${percentage.toStringAsFixed(1)}%',
        radius: 60,
        titleStyle: const TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
      );
    }).toList();
  }

  Color _getColorForCategory(String category) {
    switch (category) {
      case 'Food':
        return Colors.blue;
      case 'Transport':
        return Colors.green;
      case 'Entertainment':
        return Colors.red;
      case 'Utilities':
        return Colors.orange;
      case 'Health':
        return Colors.purple;
      default:
        return Colors.grey;
    }
  }
}
