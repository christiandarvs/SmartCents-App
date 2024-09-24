import 'package:flutter/material.dart';

import 'package:smartcents/widgets/balance_card.dart';
import 'package:smartcents/widgets/transaction_card.dart';

class Dashboard extends StatelessWidget {
  const Dashboard({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Dashboard'),
        ),
        body: const Column(
          children: [
            BalanceCard(),
            TransactionCard(),
          ],
        ),
      ),
    );
  }
}
// Expanded(
//               child: ListView.builder(
//                 scrollDirection: Axis.horizontal,
//                 itemCount: titles.length,
//                 itemBuilder: (context, index) {
//                   return Padding(
//                     padding: const EdgeInsets.symmetric(horizontal: 10),
//                     child: Column(
//                       children: [
//                         InkWell(
//                           onTap: () {
//                             // Handle tap event
//                           },
//                           child: Container(
//                             width: 100,
//                             height: 100,
//                             decoration: BoxDecoration(
//                               shape: BoxShape.circle,
//                               image: DecorationImage(
//                                 image: AssetImage(images[index]),
//                                 fit: BoxFit.cover,
//                               ),
//                               boxShadow: const [
//                                 BoxShadow(
//                                   color: Colors.black26,
//                                   blurRadius: 5,
//                                   offset: Offset(0, 5), // Shadow effect
//                                 ),
//                               ],
//                             ),
//                           ),
//                         ),
//                         const SizedBox(height: 10),
//                         Text(
//                           titles[index],
//                           style: const TextStyle(
//                             fontSize: 14,
//                             fontWeight: FontWeight.bold,
//                           ),
//                         ),
//                       ],
//                     ),
//                   );
//                 },
//               ),
//             ),

// final titles = [
//   'Financial Planning',
//   'Budget and Savings',
//   'Frugal Living',
//   // 'Investment Basics',
//   // 'Debt Management',
//   // 'Understanding Taxes',
//   // 'Financial Scams',
//   // 'Learn More'
// ];

// final images = [
//   './assets/Financial_Planning.png',
//   './assets/Budget_and_Savings.png',
//   './assets/Frugal_Living.png',
//   // './assets/Basic_Investing.png',
//   // './assets/Debt_Management.png',
//   // './assets/Understanding_Taxes.png',
//   // './assets/Financial_Scams.png',
//   // './assets/Financial_Planning.png'
// ];
