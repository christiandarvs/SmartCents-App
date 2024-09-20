import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent_bottom_nav_bar.dart';
import 'package:smartcents/blocs/budget_tracker/budget_tracker_screen.dart';
import 'package:smartcents/constants/colors.dart';
import 'package:smartcents/screens/courses.dart';
import 'package:smartcents/screens/dashboard.dart';
import 'package:smartcents/widgets/exit_dialog.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (bool didPop, Object? result) async {
        if (didPop) return;
        final bool shouldPop = await showBackDialog(context) ?? false;
        if (context.mounted && shouldPop) {
          Navigator.pop(context);
        }
      },
      child: SafeArea(
        child: PersistentTabView(
            handleAndroidBackButtonPress: false,
            backgroundColor: AppColors.primaryColor,
            context,
            screens: _buildScreens(),
            items: _navBarsItems()),
      ),
    );
  }
}

List<Widget> _buildScreens() {
  return [
    const Dashboard(),
    const BudgetTrackerScreen(),
    Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.primaryColor,
      ),
      body: Container(
        color: Colors.white,
        width: 200,
        height: 200,
      ),
    ),
    const Courses(),
    Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.primaryColor,
      ),
      body: Container(
        color: Colors.white,
        width: 200,
        height: 200,
      ),
    ),
  ];
}

List<PersistentBottomNavBarItem> _navBarsItems() {
  return [
    PersistentBottomNavBarItem(
        title: 'Home',
        icon: const Icon(Icons.home),
        activeColorPrimary: AppColors.activeIconColor,
        inactiveColorPrimary: AppColors.buttonColor),
    PersistentBottomNavBarItem(
        title: 'Budget',
        icon: const Icon(Icons.track_changes_rounded),
        activeColorPrimary: AppColors.activeIconColor,
        inactiveColorPrimary: AppColors.buttonColor),
    PersistentBottomNavBarItem(
        icon: const Icon(Icons.add),
        activeColorPrimary: AppColors.activeIconColor,
        inactiveColorPrimary: AppColors.buttonColor),
    PersistentBottomNavBarItem(
        title: 'Courses',
        icon: const Icon(Icons.library_books_rounded),
        activeColorPrimary: AppColors.activeIconColor,
        inactiveColorPrimary: AppColors.buttonColor),
    PersistentBottomNavBarItem(
        title: 'Settings',
        icon: const Icon(Icons.more_horiz_sharp),
        activeColorPrimary: AppColors.activeIconColor,
        inactiveColorPrimary: AppColors.buttonColor),
  ];
}
