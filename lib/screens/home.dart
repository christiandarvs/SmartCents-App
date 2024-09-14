import 'package:flutter/material.dart';
import 'package:smartcents/constants/colors.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: AppColors.primaryColor,
          iconTheme:
              const IconThemeData(color: AppColors.buttonColor, size: 30),
        ),
        drawer: const Drawer(),
        body: const Center(
          child: Column(
            children: [Text('Hello')],
          ),
        ),
      ),
    );
  }
}
