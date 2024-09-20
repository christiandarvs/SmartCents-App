import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:smartcents/constants/colors.dart';

class Courses extends StatelessWidget {
  const Courses({super.key});

  @override
  Widget build(BuildContext context) {
    final titles = [
      'Financial Planning',
      'Budget and Savings',
      'Frugal Living',
      'Investment Basics',
      'Debt Management',
      'Understanding Taxes',
      'Financial Scams',
      'Learn More'
    ];

    final images = [
      './assets/Financial_Planning.png',
      './assets/Budget_and_Savings.png',
      './assets/Frugal_Living.png',
      './assets/Basic_Investing.png',
      './assets/Debt_Management.png',
      './assets/Understanding_Taxes.png',
      './assets/Financial_Scams.png',
      './assets/Financial_Planning.png',
    ];

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          shadowColor: Colors.black,
          backgroundColor: AppColors.primaryColor,
          title: const Text(
            'Courses',
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
        ),
        body: Center(
          child: GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: _getCrossAxisCount(context),
              childAspectRatio: 0.75,
            ),
            itemCount: titles.length,
            itemBuilder: (ctx, index) =>
                _buildCourseCard(ctx, titles[index], images[index]),
          ),
        ),
      ),
    );
  }

  int _getCrossAxisCount(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    if (width < 600) {
      return 2; // Two columns for small devices
    } else if (width < 900) {
      return 3; // Three columns for medium devices
    } else {
      return 4; // Four columns for large devices
    }
  }

  Widget _buildCourseCard(BuildContext context, String title, String image) {
    return InkWell(
      onTap: () {
        // Add your onTap functionality here if needed
      },
      child: Card(
        elevation: 4,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
          side: const BorderSide(color: Colors.black),
        ),
        margin: const EdgeInsets.all(7),
        child: Column(
          children: [
            ClipRRect(
              borderRadius:
                  const BorderRadius.vertical(top: Radius.circular(8)),
              child: Image.asset(
                image,
                height: _getImageHeight(context),
                fit: BoxFit.cover,
                width: double.infinity,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(5),
              child: AutoSizeText(
                title,
                softWrap: true,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 15,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
      ),
    );
  }

  double _getImageHeight(BuildContext context) {
    // Adjust the height based on device width
    double width = MediaQuery.of(context).size.width;
    if (width < 600) {
      return 150; // Smaller height for small devices
    } else if (width < 900) {
      return 200; // Medium height for medium devices
    } else {
      return 250; // Larger height for large devices
    }
  }
}



// onTap: () => Navigator.push(
//   context,
//   MaterialPageRoute(
//     builder: (context) => SecondPage(
//       pageName: titles[index],
//       // textToSpeechEnabled: widget.textToSpeechEnabled,
//     ),
//   ),
// ),
            // crossAxisCount: ResponsiveValue<int>(
              //     defaultValue: 2,
              //     context,
              //     conditionalValues: [
              //       const Condition.equals(name: TABLET, value: 3),
              //       const Condition.largerThan(
              //           name: TABLET, value: 4, breakpoint: 800),
              //     ]).value,