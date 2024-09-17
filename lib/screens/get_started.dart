import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:smartcents/constants/colors.dart';
import 'package:smartcents/screens/home.dart';

class GetStarted extends StatelessWidget {
  const GetStarted({super.key});

  static const double imageSize = 350.0;
  static const double buttonWidth = 250.0;
  static const double buttonHeight = 50.0;
  static const double borderRadiusValue = 25.0;

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (bool didPop, Object? result) async {
        if (didPop) {
          return;
        }
        final bool shouldPop = await _showBackDialog(context) ?? false;
        if (context.mounted && shouldPop) {
          Navigator.pop(context);
        }
      },
      child: SafeArea(
        // top: false,
        child: Scaffold(
          backgroundColor: AppColors.primaryColor,
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Spacer(),
                _buildImage(),
                _buildSubtitle(),
                const Spacer(),
                _buildGetStartedButton(context),
                const Spacer(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // Create a method for the image widget
  Widget _buildImage() {
    return const Image(
      image: AssetImage('./assets/get_started_coin.png'),
      height: imageSize,
      width: imageSize,
      fit: BoxFit.cover,
    );
  }

  Widget _buildSubtitle() {
    return Text('"Where your financial literacy journey begins"',
        style: GoogleFonts.workSans(color: Colors.white, fontSize: 14));
  }

  // Create a method for the Get Started button widget
  Widget _buildGetStartedButton(context) {
    return SizedBox(
      width: buttonWidth,
      height: buttonHeight,
      child: ElevatedButton(
        onPressed: () async {
          // Mark the app as not first-time
          SharedPreferences prefs = await SharedPreferences.getInstance();
          await prefs.setBool('isFirstTime', false);

          // Navigate to the Home screen
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => const Home()),
          );
        },
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
            side: const BorderSide(color: Colors.black),
            borderRadius: BorderRadius.circular(borderRadiusValue),
          ),
          backgroundColor: AppColors.buttonColor,
        ),
        child: Text(
          'Get Started',
          style: GoogleFonts.workSans(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}

Future<bool?> _showBackDialog(context) {
  return showDialog<bool>(
    barrierDismissible: false,
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: const Text('Exit'),
        content: const Text(
          'Are you sure you want to exit the application?',
        ),
        actions: <Widget>[
          TextButton(
            style: TextButton.styleFrom(
              textStyle: Theme.of(context).textTheme.labelLarge,
            ),
            child: const Text('Cancel'),
            onPressed: () {
              Navigator.pop(context, false);
            },
          ),
          TextButton(
            style: TextButton.styleFrom(
              textStyle: Theme.of(context).textTheme.labelLarge,
            ),
            child: const Text(
              'Exit',
              style: TextStyle(color: Colors.red),
            ),
            onPressed: () {
              SystemNavigator.pop();
            },
          ),
        ],
      );
    },
  );
}
