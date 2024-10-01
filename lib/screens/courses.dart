import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:persistent_bottom_nav_bar/persistent_bottom_nav_bar.dart';
import 'package:provider/provider.dart';
import 'package:smartcents/providers/survey_provider.dart';
import 'package:smartcents/providers/theme_provider.dart';
import 'package:smartcents/widgets/module.dart';

class Courses extends StatelessWidget {
  const Courses({super.key});

  @override
  Widget build(BuildContext context) {
    final titles = [
      'Financial Planning',
      'Budget & Savings',
      'Frugal Living and Spending Wisely',
      'Understanding Taxes',
      'Debt Management',
      'Investment Basics',
      'Financial Scams',
      'Learn More'
    ];

    final images = [
      './assets/Financial Planning.png',
      './assets/Budget & Savings.png',
      './assets/Frugal Living.png',
      './assets/Understanding Taxes.png',
      './assets/Debt Management.png',
      './assets/Investment Basics.png',
      './assets/Financial_Scams.png',
      './assets/Financial Planning.png',
    ];

    final modules = [
      const Module(
          title: 'Financial Planning',
          summary: 'Learn how to create a comprehensive financial plan.',
          fileName: 'Financial Planning.pdf'),
      const Module(
          title: 'Budget and Savings',
          summary:
              'Discover effective budgeting techniques and saving strategies.',
          fileName: 'Budgeting & Saving.pdf'),
      const Module(
          title: 'Frugal Living',
          summary: 'Explore tips and tricks for living a frugal lifestyle.',
          fileName: 'Frugal Living and Spending Wisely.pdf'),
      const Module(
          title: 'Understanding Taxes',
          summary: 'Get insights into the tax system and how it affects you.',
          fileName: 'Understanding Taxes.pdf'),
      const Module(
          title: 'Debt Management',
          summary: 'Learn how to manage and eliminate debt effectively.',
          fileName: 'Reviewer.pdf'),
      const Module(
          title: 'Investment Basics',
          summary: 'Understand the fundamentals of investing.',
          fileName: 'Investing Basics.pdf'),
      const Module(
          title: 'Financial Scams',
          summary: 'Recognize and avoid common financial scams.',
          fileName: 'Reviewer.pdf'),
      const Module(
          title: 'Learn More',
          summary: 'Resources for further financial education.',
          fileName: 'Reviewer.pdf'),
    ];

    final surveyProvider = Provider.of<SurveyProvider>(context);
    final themeProvider = Provider.of<ThemeProvider>(context);

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: const Color(0xff6B4D57),
          automaticallyImplyLeading: false,
          title: const Text('Modules'),
        ),
        body: Center(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Recommended Modules',
                    style: GoogleFonts.poppins(
                        fontWeight: FontWeight.bold, fontSize: 18),
                  ),
                ),
              ),
              Expanded(
                child: FutureBuilder<List<String>>(
                  future: surveyProvider.hasCompletedSurvey
                      ? surveyProvider.getRecommendedCourses()
                      : surveyProvider.predictAndStoreCourse(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    } else if (snapshot.hasError) {
                      return Text('Error: ${snapshot.error}');
                    } else if (snapshot.hasData) {
                      List<String> recommendedCourses = snapshot.data ?? [];

                      return ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: recommendedCourses.length,
                        itemBuilder: (context, index) {
                          String recommendedTitle =
                              recommendedCourses[index].trim();

                          int titleIndex = titles.indexWhere(
                            (title) =>
                                title.trim().toLowerCase() ==
                                recommendedTitle.toLowerCase(),
                          );

                          if (titleIndex != -1) {
                            return _buildRecommendedCourseCard(
                                context,
                                titles[titleIndex],
                                images[titleIndex],
                                modules[titleIndex],
                                recommendedCourses,
                                themeProvider);
                          } else {
                            return const SizedBox.shrink();
                          }
                        },
                      );
                    }
                    return const SizedBox.shrink();
                  },
                ),
              ),
              Expanded(
                flex: 2,
                child: Column(
                  children: [
                    const SizedBox(height: 5),
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          'Available Modules',
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
                            ctx,
                            titles[index],
                            images[index],
                            modules[index],
                            themeProvider),
                      ),
                    ),
                  ],
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

  Widget _buildCourseCard(BuildContext context, String title, String image,
      Widget module, ThemeProvider themeProvider) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
        side: const BorderSide(color: Colors.black),
      ),
      margin: const EdgeInsets.all(7),
      child: Stack(
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
                color: themeProvider.isDarkMode ? Colors.white : Colors.black54,
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

  Widget _buildRecommendedCourseCard(
      BuildContext context,
      String title,
      String image,
      Widget module,
      List<String> recommededCourses,
      ThemeProvider themeProvider) {
    return Padding(
      padding: const EdgeInsets.only(right: 12.0, left: 8),
      child: InkWell(
        onTap: () {
          HapticFeedback.mediumImpact();
          PersistentNavBarNavigator.pushNewScreen(
            pageTransitionAnimation: PageTransitionAnimation.fade,
            context,
            screen: module,
            withNavBar: false,
          );
        },
        child: Column(
          children: [
            Container(
              width: 150,
              height: 150,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  color: themeProvider.isDarkMode ? Colors.white : Colors.black,
                  width: 2,
                ),
              ),
              child: CircleAvatar(
                radius: 80,
                backgroundImage: AssetImage(image),
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            Text(title)
          ],
        ),
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
