import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:smartcents/providers/budget_provider.dart';
import 'package:smartcents/providers/permission_provider.dart';
import 'package:smartcents/providers/survey_provider.dart';
import 'package:smartcents/providers/theme_provider.dart'; // Import ThemeProvider
import 'package:smartcents/screens/get_started.dart';
import 'package:smartcents/screens/home.dart';
import 'package:flutter/services.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);

  SharedPreferences prefs = await SharedPreferences.getInstance();
  bool isFirstTime = prefs.getBool('isFirstTime') ?? true;

  runApp(MyApp(isFirstTime: isFirstTime));
}

class MyApp extends StatelessWidget {
  final bool isFirstTime;

  const MyApp({super.key, this.isFirstTime = true});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => BudgetProvider()),
        ChangeNotifierProvider(create: (context) => PermissionProvider()),
        ChangeNotifierProvider(create: (context) => SurveyProvider()),
        ChangeNotifierProvider(
            create: (context) => ThemeProvider()), // Initialize ThemeProvider
      ],
      child: Consumer<ThemeProvider>(
        builder: (context, themeProvider, child) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'SmartCents',
            theme: themeProvider.themeLight,
            darkTheme: themeProvider.themeDark,
            themeMode:
                themeProvider.themeMode, // Use themeMode to toggle themes
            home: isFirstTime ? const GetStarted() : const Home(),
          );
        },
      ),
    );
  }
}
