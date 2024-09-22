import 'package:flutter/material.dart';
import 'package:smartcents/constants/colors.dart';

class FinancialPlanning extends StatelessWidget {
  const FinancialPlanning({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text(
            'Financial Planning',
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
          backgroundColor: AppColors.primaryColor,
        ),
        body: const Center(
          child: Column(
            children: [Text('Financial Planning is important :)')],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {},
          child: const Icon(Icons.file_download),
        ),
      ),
    );
  }
}
