import 'package:flutter/material.dart';
import 'package:smartcents/constants/colors.dart';

class Dashboard extends StatelessWidget {
  const Dashboard({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.primaryColor,
      ),
      body: const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [Text('Dashboard')],
        ),
      ),
    ));
  }
}
