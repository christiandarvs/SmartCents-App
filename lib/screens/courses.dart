import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:persistent_bottom_nav_bar/persistent_bottom_nav_bar.dart';
import 'package:smartcents/widgets/module.dart';

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

    final modules = [
      const Module(
          title: 'Financial Planning',
          summary: 'Learn how to create a comprehensive financial plan.',
          fileName: 'Reviewer.pdf'),
      const Module(
          title: 'Budget and Savings',
          summary:
              'Discover effective budgeting techniques and saving strategies.',
          fileName: 'Reviewer.pdf'),
      const Module(
          title: 'Frugal Living',
          summary: 'Explore tips and tricks for living a frugal lifestyle.',
          fileName: 'Reviewer.pdf'),
      const Module(
          title: 'Investment Basics',
          summary: 'Understand the fundamentals of investing.',
          fileName: 'Reviewer.pdf'),
      const Module(
          title: 'Debt Management',
          summary: 'Learn how to manage and eliminate debt effectively.',
          fileName: 'Reviewer.pdf'),
      const Module(
          title: 'Understanding Taxes',
          summary: 'Get insights into the tax system and how it affects you.',
          fileName: 'Reviewer.pdf'),
      const Module(
          title: 'Financial Scams',
          summary: 'Recognize and avoid common financial scams.',
          fileName: 'Reviewer.pdf'),
      const Module(
          title: 'Learn More',
          summary: 'Resources for further financial education.',
          fileName: 'Reviewer.pdf'),
    ];

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: const Text('Courses'),
        ),
        body: Center(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Recommended Course',
                    style: GoogleFonts.poppins(
                        fontWeight: FontWeight.bold, fontSize: 18),
                  ),
                ),
              ),
              _buildCourseCard(context, titles[0], images[0], modules[0], true),
              const SizedBox(height: 15),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Available Courses',
                    style: GoogleFonts.poppins(
                        fontWeight: FontWeight.bold, fontSize: 18),
                  ),
                ),
              ),
              Expanded(
                child: GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: _getCrossAxisCount(context),
                    childAspectRatio: 0.65,
                  ),
                  itemCount: titles.length,
                  itemBuilder: (ctx, index) => _buildCourseCard(
                      ctx, titles[index], images[index], modules[index], false),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  int _getCrossAxisCount(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    if (width < 600) return 2;
    if (width < 900) return 3;
    return 4;
  }

  Widget _buildCourseCard(
    BuildContext context,
    String title,
    String image,
    Widget module,
    bool isHorizontal,
  ) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
        side: const BorderSide(color: Colors.black),
      ),
      margin: const EdgeInsets.all(7),
      child: isHorizontal
          ? Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                ClipRRect(
                  borderRadius:
                      const BorderRadius.horizontal(left: Radius.circular(8)),
                  child: Image.asset(
                    image,
                    height: _getImageHeight(context),
                    width: MediaQuery.of(context).size.width *
                        0.45, // Responsive width
                    fit: BoxFit.cover,
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: Padding(
                    padding: EdgeInsets.all(MediaQuery.of(context).size.width *
                        0.05), // Responsive padding
                    child: AutoSizeText(
                      title,
                      softWrap: true,
                      style: GoogleFonts.poppins(
                        fontWeight: FontWeight.bold,
                        fontSize: 15, // Responsive font size
                      ),
                      textAlign: TextAlign.left,
                    ),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.only(
                        right: MediaQuery.of(context).size.width *
                            0.02), // Responsive padding
                    child: IconButton(
                      icon: Icon(
                        Icons.play_circle_fill,
                        color: Colors.black54,
                        size: _getIconSize(
                            context), // Keep this as is for responsiveness
                      ),
                      onPressed: () {
                        PersistentNavBarNavigator.pushNewScreen(
                          pageTransitionAnimation: PageTransitionAnimation.fade,
                          context,
                          screen: module,
                          withNavBar: false,
                        );
                      },
                    ),
                  ),
                ),
              ],
            )
          : Stack(
              children: [
                Column(
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
                        style: GoogleFonts.poppins(
                          fontWeight: FontWeight.bold,
                          fontSize: 15,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ],
                ),
                Positioned(
                  bottom: 0,
                  right: 0,
                  child: IconButton(
                    icon: Icon(
                      Icons.play_circle_fill,
                      color: Colors.black54,
                      size: _getIconSize(context),
                    ),
                    onPressed: () {
                      PersistentNavBarNavigator.pushNewScreen(
                        pageTransitionAnimation: PageTransitionAnimation.fade,
                        context,
                        screen: module,
                        withNavBar: false,
                      );
                    },
                  ),
                ),
              ],
            ),
    );
  }

  double _getImageHeight(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    if (width < 600) return 150;
    if (width < 900) return 200;
    return 250;
  }
}

double _getIconSize(BuildContext context) {
  double width = MediaQuery.of(context).size.width;
  if (width < 600) return 40;
  if (width < 900) return 45;
  return 50;
}
