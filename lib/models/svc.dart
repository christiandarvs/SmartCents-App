import 'package:sklite/SVM/SVM.dart';
import 'dart:convert';
import 'package:flutter/services.dart' show rootBundle;

class SVMModel {
  SVC? svc;
  List<String> courses = [
    "Budget & Savings",
    "Budget & Savings, Debt Management",
    "Budget & Savings, Debt Management, Financial Planning",
    "Budget & Savings, Debt Management, Frugal Living and Spending Wisely",
    "Budget & Savings, Debt Management, Investment Basics",
    "Budget & Savings, Debt Management, Understanding Taxes",
    "Budget & Savings, Financial Planning",
    "Budget & Savings, Financial Planning, Frugal Living and Spending Wisely",
    "Budget & Savings, Financial Planning, Investment Basics",
    "Budget & Savings, Financial Planning, Understanding Taxes",
    "Budget & Savings, Frugal Living and Spending Wisely",
    "Budget & Savings, Frugal Living and Spending Wisely, Investment Basics",
    "Budget & Savings, Frugal Living and Spending Wisely, Understanding Taxes",
    "Budget & Savings, Investment Basics",
    "Budget & Savings, Investment Basics, Understanding Taxes",
    "Budget & Savings, Understanding Taxes",
    "Debt Management",
    "Debt Management, Financial Planning",
    "Debt Management, Financial Planning, Frugal Living and Spending Wisely",
    "Debt Management, Financial Planning, Investment Basics",
    "Debt Management, Frugal Living and Spending Wisely",
    "Debt Management, Frugal Living and Spending Wisely, Investment Basics",
    "Debt Management, Frugal Living and Spending Wisely, Understanding Taxes",
    "Debt Management, Investment Basics",
    "Debt Management, Investment Basics, Understanding Taxes",
    "Debt Management, Understanding Taxes",
    "Financial Planning",
    "Financial Planning, Frugal Living and Spending Wisely",
    "Financial Planning, Frugal Living and Spending Wisely, Investment Basics",
    "Financial Planning, Frugal Living and Spending Wisely, Understanding Taxes",
    "Financial Planning, Investment Basics",
    "Financial Planning, Investment Basics, Understanding Taxes",
    "Financial Planning, Understanding Taxes",
    "Frugal Living and Spending Wisely",
    "Frugal Living and Spending Wisely, Investment Basics",
    "Frugal Living and Spending Wisely, Investment Basics, Understanding Taxes",
    "Frugal Living and Spending Wisely, Understanding Taxes",
    "Investment Basics",
    "Investment Basics, Understanding Taxes",
    "Understanding Taxes"
  ];

  Future<void> loadModel() async {
    String modelData = await rootBundle.loadString("assets/jsons/flazy.json");
    svc = SVC.fromMap(json.decode(modelData));
  }

  // Method to predict based on inputs from survey
  String predict(List<double> inputs) {
    if (svc == null) {
      return "Error: Model not loaded";
    }
    int predictionIndex = svc!.predict(inputs);
    if (predictionIndex < courses.length) {
      return courses[predictionIndex];
    } else {
      return "Prediction index out of bounds";
    }
  }
}
