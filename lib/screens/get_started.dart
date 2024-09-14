import 'package:flutter/material.dart';
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
    return SafeArea(
      top: false,
      child: Scaffold(
        backgroundColor: AppColors.primaryColor,
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Spacer(),
              _buildImage(),
              const Spacer(),
              _buildGetStartedButton(context),
              const Spacer(),
            ],
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
