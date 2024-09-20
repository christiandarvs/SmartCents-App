import 'package:flutter/material.dart';
import 'package:smartcents/constants/colors.dart';

class Dashboard extends StatelessWidget {
  final VoidCallback onViewMorePressed;

  const Dashboard({super.key, required this.onViewMorePressed});

  @override
  Widget build(BuildContext context) {
    final titles = [
      'Financial Planning',
      'Budget and Savings',
      'Frugal Living',
      // 'Investment Basics',
      // 'Debt Management',
      // 'Understanding Taxes',
      // 'Financial Scams',
      // 'Learn More'
    ];

    final images = [
      './assets/Financial_Planning.png',
      './assets/Budget_and_Savings.png',
      './assets/Frugal_Living.png',
      // './assets/Basic_Investing.png',
      // './assets/Debt_Management.png',
      // './assets/Understanding_Taxes.png',
      // './assets/Financial_Scams.png',
      // './assets/Financial_Planning.png'
    ];

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: AppColors.primaryColor,
        ),
        body: Column(
          children: [
            Container(
              width: double.infinity,
              color: Colors.blue,
              height: 420,
            ),
            Container(
              margin: const EdgeInsets.only(right: 10, bottom: 5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  TextButton(
                    onPressed: onViewMorePressed, // Navigates to "Courses"
                    child: const Text('View More'),
                  ),
                ],
              ),
            ),
            Expanded(
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: titles.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Column(
                      children: [
                        InkWell(
                          onTap: () {
                            // Handle tap event
                          },
                          child: Container(
                            width: 100,
                            height: 100,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              image: DecorationImage(
                                image: AssetImage(images[index]),
                                fit: BoxFit.cover,
                              ),
                              boxShadow: const [
                                BoxShadow(
                                  color: Colors.black26,
                                  blurRadius: 5,
                                  offset: Offset(0, 5), // Shadow effect
                                ),
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(height: 10),
                        Text(
                          titles[index],
                          style: const TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
