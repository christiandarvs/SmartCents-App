import 'package:flutter/material.dart';
import 'package:smartcents/constants/colors.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      // top: false,
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
        bottomNavigationBar: BottomNavigationBar(
          selectedFontSize: 0,
          backgroundColor: AppColors.primaryColor,
          selectedIconTheme: const IconThemeData(color: Colors.white),
          unselectedIconTheme: const IconThemeData(color: Color(0xffFFD500)),
          items: const [
            BottomNavigationBarItem(
                icon: Icon(Icons.home), label: 'Home', tooltip: 'Home'),
            BottomNavigationBarItem(
                icon: Icon(Icons.book), label: 'Courses', tooltip: 'Courses'),
            BottomNavigationBarItem(
                icon: Icon(Icons.account_circle_outlined),
                label: 'Profile',
                tooltip: 'Profile'),
          ],
          currentIndex: 0,
          onTap: (value) {},
        ),
      ),
    );
  }
}
