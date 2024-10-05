import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:smartcents/constants/colors.dart';

class ThemeProvider extends ChangeNotifier {
  ThemeMode _themeMode = ThemeMode.light;

  ThemeProvider() {
    _loadThemeFromPrefs();
  }

  ThemeMode get themeMode => _themeMode;

  bool get isDarkMode => _themeMode == ThemeMode.dark;

  void toggleTheme() async {
    _themeMode =
        _themeMode == ThemeMode.light ? ThemeMode.dark : ThemeMode.light;
    notifyListeners();
    await _saveThemeToPrefs();
  }

  Future<void> _saveThemeToPrefs() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool('isDarkMode', isDarkMode);
  }

  Future<void> _loadThemeFromPrefs() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool? isDarkMode = prefs.getBool('isDarkMode');
    if (isDarkMode != null) {
      _themeMode = isDarkMode ? ThemeMode.dark : ThemeMode.light;
    }
    notifyListeners();
  }

  final ThemeData themeLight = ThemeData(
    colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
    useMaterial3: true,
    appBarTheme: AppBarTheme(
      iconTheme: const IconThemeData(color: Colors.white),
      shadowColor: Colors.black,
      backgroundColor: const Color(0xff6B4D57),
      titleTextStyle: GoogleFonts.poppins(
          color: Colors.white, fontWeight: FontWeight.bold, fontSize: 20),
    ),
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
        backgroundColor: AppColors.buttonColor, foregroundColor: Colors.black),
  );

  final ThemeData themeDark = ThemeData.dark().copyWith(
    appBarTheme: AppBarTheme(
      iconTheme: const IconThemeData(color: Colors.white),
      shadowColor: Colors.black,
      backgroundColor: const Color(0xff6B4D57),
      titleTextStyle: GoogleFonts.poppins(
          color: Colors.white, fontWeight: FontWeight.bold, fontSize: 20),
    ),
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
        backgroundColor: AppColors.buttonColor, foregroundColor: Colors.black),
  );
}
