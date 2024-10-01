import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent_bottom_nav_bar.dart';
import 'package:provider/provider.dart';
import 'package:smartcents/constants/colors.dart';
import 'package:smartcents/providers/survey_provider.dart';
import 'package:smartcents/screens/budget_input_screen.dart';
import 'package:smartcents/screens/budget_screen.dart';
import 'package:smartcents/screens/courses.dart';
import 'package:smartcents/screens/dashboard.dart';
import 'package:smartcents/screens/settings.dart';
import 'package:smartcents/screens/survey.dart';
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
          context,
          navBarStyle: NavBarStyle.style9,
          navBarHeight: 70,
          padding: const EdgeInsets.all(10),
          handleAndroidBackButtonPress: false,
          backgroundColor: const Color(0xff6B4D57),
          screens: _buildScreens(context),
          items: _navBarsItems(),
        ),
      ),
    );
  }

  List<Widget> _buildScreens(BuildContext context) {
    final hasCompletedSurvey =
        context.watch<SurveyProvider>().hasCompletedSurvey;
    return [
      _wrapWithScaffoldMessenger(
          const Dashboard()), // Wrap with ScaffoldMessenger
      _wrapWithScaffoldMessenger(const BudgetScreen()),
      _wrapWithScaffoldMessenger(const BudgetInputScreen()),
      _wrapWithScaffoldMessenger(hasCompletedSurvey
          ? const Courses()
          : SurveyScreen()), // Conditional screen wrapped with ScaffoldMessenger
      _wrapWithScaffoldMessenger(const Scaffold(
        body: Settings(),
      )),
    ];
  }

  // Helper method to wrap each screen with a ScaffoldMessenger
  Widget _wrapWithScaffoldMessenger(Widget screen) {
    return ScaffoldMessenger(
      child: screen,
    );
  }

  List<PersistentBottomNavBarItem> _navBarsItems() {
    return [
      PersistentBottomNavBarItem(
        title: 'Home',
        icon: const Icon(Icons.home),
        activeColorPrimary: AppColors.activeIconColor,
        inactiveColorPrimary: AppColors.buttonColor,
      ),
      PersistentBottomNavBarItem(
        title: 'Budget',
        icon: const Icon(Icons.track_changes_rounded),
        activeColorPrimary: AppColors.activeIconColor,
        inactiveColorPrimary: AppColors.buttonColor,
      ),
      PersistentBottomNavBarItem(
        icon: const Icon(Icons.add),
        activeColorPrimary: AppColors.activeIconColor,
        inactiveColorPrimary: AppColors.buttonColor,
      ),
      PersistentBottomNavBarItem(
        title: 'Courses',
        icon: const Icon(Icons.library_books_rounded),
        activeColorPrimary: AppColors.activeIconColor,
        inactiveColorPrimary: AppColors.buttonColor,
      ),
      PersistentBottomNavBarItem(
        title: 'Settings',
        icon: const Icon(Icons.settings),
        activeColorPrimary: AppColors.activeIconColor,
        inactiveColorPrimary: AppColors.buttonColor,
      ),
    ];
  }
}
