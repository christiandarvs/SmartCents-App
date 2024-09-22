import 'package:flutter/material.dart';
import '../models/budget_item.dart';

class BudgetProvider with ChangeNotifier {
  final List<BudgetItem> _items = [];

  List<BudgetItem> get items => _items;

  double get totalBudget => _items.fold(0, (sum, item) => sum + item.amount);

  void addItem(String name, double amount) {
    _items.add(BudgetItem(name: name, amount: amount));
    notifyListeners();
  }

  void removeItem(int index) {
    _items.removeAt(index);
    notifyListeners();
  }

  void loadBudgets() {
    // Load budgets from persistent storage or any source
    // Notify listeners after loading if necessary
    notifyListeners();
  }
}
