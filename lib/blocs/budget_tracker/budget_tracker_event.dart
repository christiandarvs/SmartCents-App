import 'package:equatable/equatable.dart';

abstract class BudgetTrackerEvent extends Equatable {
  const BudgetTrackerEvent();

  @override
  List<Object?> get props => [];
}

class LoadBudgets extends BudgetTrackerEvent {}

class AddBudget extends BudgetTrackerEvent {
  final double amount;
  final String category;

  const AddBudget(this.amount, this.category);

  @override
  List<Object?> get props => [amount, category];
}

class UpdateBudget extends BudgetTrackerEvent {
  final double amount;
  final String category;

  const UpdateBudget(this.amount, this.category);

  @override
  List<Object?> get props => [amount, category];
}

class DeleteBudget extends BudgetTrackerEvent {
  final String category;

  const DeleteBudget(this.category);

  @override
  List<Object?> get props => [category];
}
