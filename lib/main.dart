import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:smartcents/blocs/budget_tracker/budget_tracker_bloc.dart';
import 'package:smartcents/blocs/budget_tracker/budget_tracker_event.dart';
import 'package:smartcents/screens/get_started.dart';
import 'package:smartcents/screens/home.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]);
  SharedPreferences prefs = await SharedPreferences.getInstance();

  // Check if the user is opening the app for the first time
  bool isFirstTime = prefs.getBool('isFirstTime') ?? true;

  runApp(MyApp(isFirstTime: isFirstTime));
}

class MyApp extends StatelessWidget {
  final bool isFirstTime;

  const MyApp({super.key, this.isFirstTime = true});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'SmartCents',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      // Show GetStarted screen if it's the user's first time, otherwise show Home
      home: isFirstTime
          ? const GetStarted()
          : BlocProvider(
              create: (context) => BudgetTrackerBloc()..add(LoadBudgets()),
              child: const Home(),
            ),
    );
  }
}
