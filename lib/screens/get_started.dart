import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:lottie/lottie.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:smartcents/screens/home.dart';
import 'package:smartcents/widgets/exit_dialog.dart';

class GetStarted extends StatelessWidget {
  const GetStarted({super.key});

  static const double imageSize = 420;
  static const double imageHeight = 460;
  static const double buttonWidth = 250.0;
  static const double buttonHeight = 50.0;
  static const double borderRadiusValue = 25.0;

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
        child: Scaffold(
          body: IntroductionScreen(
            scrollPhysics: const BouncingScrollPhysics(),
            pages: _buildPages(),
            onDone: () => _onDone(context),
            showSkipButton: true,
            skip: const Text("Skip"),
            next: const Icon(Icons.arrow_forward),
            done: const Text("Done",
                style: TextStyle(fontWeight: FontWeight.w600)),
            dotsDecorator: _buildDotsDecorator(context),
          ),
        ),
      ),
    );
  }

  List<PageViewModel> _buildPages() {
    return [
      _createPageViewModel(
          title: 'Welcome to SmartCents',
          body: "Where your financial literacy begins",
          imagePath: './assets/images/get_started_coin.png',
          imageHeight: imageHeight,
          imageWidth: imageSize,
          // imageFlex: 2,
          usesLottie: true),
      _createPageViewModel(
        title: "Your Path to Smart Money Habits",
        body:
            "Understand the basics of budgeting, saving, investing, and more with easy-to-follow lessons.",
        imagePath: './assets/images/Accountant.png',
      ),
      _createPageViewModel(
        title: "Achieve Your Financial Goals",
        body:
            "Track your progress as you work toward financial stability and success.",
        imagePath: './assets/images/Career.png',
      ),
      _createPageViewModel(
        title: "Empower Yourself with Financial Knowledge",
        body:
            "Master the essentials of money management with interactive tools and resources.",
        imagePath: './assets/images/Bookworm.png',
      ),
    ];
  }

  PageViewModel _createPageViewModel(
      {required String title,
      required String body,
      required String imagePath,
      double imageHeight = 350,
      double imageWidth = double.infinity,
      int? imageFlex,
      bool? usesLottie}) {
    return PageViewModel(
      title: title,
      body: body,
      image: Center(
        child: (usesLottie ?? false)
            ? Lottie.asset('./assets/jsons/lottie-animation.json',
                fit: BoxFit.cover, height: imageHeight, width: 350)
            : Image.asset(imagePath,
                height: imageHeight, width: 350, fit: BoxFit.contain),
      ),
      decoration: PageDecoration(
          bodyTextStyle: GoogleFonts.manrope(
              fontSize: 18, fontWeight: FontWeight.normal, color: Colors.black),
          titleTextStyle: GoogleFonts.poppins(
              fontWeight: FontWeight.bold, fontSize: 20, color: Colors.black),
          imagePadding: const EdgeInsets.only(top: 35),
          pageColor: const Color.fromARGB(255, 231, 176, 176),
          imageFlex: imageFlex ?? 1),
    );
  }

  DotsDecorator _buildDotsDecorator(BuildContext context) {
    return DotsDecorator(
      size: const Size.square(10.0),
      activeSize: const Size(22.0, 10.0),
      activeColor: Theme.of(context).primaryColor,
      color: Colors.black26,
      spacing: const EdgeInsets.symmetric(horizontal: 3.0),
      activeShape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(borderRadiusValue),
      ),
    );
  }

  Future<void> _onDone(BuildContext context) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool('isFirstTime', false);

    if (context.mounted) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const Home()),
      );
    }
  }
}
