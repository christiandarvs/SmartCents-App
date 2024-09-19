import 'package:equatable/equatable.dart';

abstract class BudgetTrackerState extends Equatable {
  const BudgetTrackerState();

  @override
  List<Object?> get props => [];
}

class BudgetTrackerInitial extends BudgetTrackerState {}

class BudgetTrackerLoading extends BudgetTrackerState {}

class BudgetTrackerLoaded extends BudgetTrackerState {
  final Map<String, double> budgets; // category to amount mapping

  const BudgetTrackerLoaded(this.budgets);

  @override
  List<Object?> get props => [budgets];
}

class BudgetTrackerError extends BudgetTrackerState {
  final String message;

  const BudgetTrackerError(this.message);

  @override
  List<Object?> get props => [message];
}
