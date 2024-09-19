import 'package:flutter_bloc/flutter_bloc.dart';
import 'budget_tracker_event.dart';
import 'budget_tracker_state.dart';

class BudgetTrackerBloc extends Bloc<BudgetTrackerEvent, BudgetTrackerState> {
  BudgetTrackerBloc() : super(BudgetTrackerInitial()) {
    on<LoadBudgets>(_onLoadBudgets);
    on<AddBudget>(_onAddBudget);
    on<UpdateBudget>(_onUpdateBudget);
    on<DeleteBudget>(_onDeleteBudget);
  }

  Future<void> _onLoadBudgets(
      LoadBudgets event, Emitter<BudgetTrackerState> emit) async {
    emit(BudgetTrackerLoading());
    try {
      // Simulate a delay
      await Future.delayed(const Duration(seconds: 2));
      // For example purposes, using dummy data
      final budgets = {'Food': 100.0, 'Transport': 50.0};
      emit(BudgetTrackerLoaded(budgets));
    } catch (e) {
      emit(const BudgetTrackerError('Failed to load budgets'));
    }
  }

  void _onAddBudget(AddBudget event, Emitter<BudgetTrackerState> emit) {
    if (state is BudgetTrackerLoaded) {
      final currentState = state as BudgetTrackerLoaded;
      final updatedBudgets = Map<String, double>.from(currentState.budgets);
      updatedBudgets[event.category] = event.amount;
      emit(BudgetTrackerLoaded(updatedBudgets));
    }
  }

  void _onUpdateBudget(UpdateBudget event, Emitter<BudgetTrackerState> emit) {
    // Handle the UpdateBudget event
    // Implement your logic here
  }

  void _onDeleteBudget(DeleteBudget event, Emitter<BudgetTrackerState> emit) {
    // Handle the DeleteBudget event
    // Implement your logic here
  }
}
