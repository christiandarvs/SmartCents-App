import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smartcents/constants/colors.dart';
import 'budget_tracker_bloc.dart';
import 'budget_tracker_event.dart';
import 'budget_tracker_state.dart';

class BudgetTrackerScreen extends StatelessWidget {
  const BudgetTrackerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.primaryColor,
      ),
      body: BlocBuilder<BudgetTrackerBloc, BudgetTrackerState>(
        bloc: BudgetTrackerBloc(),
        builder: (context, state) {
          if (state is BudgetTrackerLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is BudgetTrackerLoaded) {
            if (state.budgets.isEmpty) {
              return const Center(child: Text('No budgets available'));
            }
            return ListView.builder(
              itemCount: state.budgets.length,
              itemBuilder: (context, index) {
                final category = state.budgets.keys.elementAt(index);
                final amount = state.budgets[category]!;
                return ListTile(
                  title: Text('$category: \$${amount.toStringAsFixed(2)}'),
                );
              },
            );
          } else if (state is BudgetTrackerError) {
            return Center(child: Text('Error: ${state.message}'));
          }
          return const Center(child: Text('No data available'));
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          BlocProvider.of<BudgetTrackerBloc>(context).add(
            const AddBudget(100.0, 'Foof'),
          );
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
