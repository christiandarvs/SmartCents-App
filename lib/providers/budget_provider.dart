import 'package:flutter/material.dart';

class BudgetProvider extends ChangeNotifier {
  String _itemName = '';
  String _amount = '';
  String _category = 'Food';

  String get itemName => _itemName;
  String get amount => _amount;
  String get category => _category;

  void setItemName(String name) {
    _itemName = name;
    notifyListeners();
  }

  void setAmount(String amt) {
    _amount = amt;
    notifyListeners();
  }

  void setCategory(String cat) {
    _category = cat;
    notifyListeners();
  }

  void submitData() {
    // Handle submission logic here
    notifyListeners();
  }
}
