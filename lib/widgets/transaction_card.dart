import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:smartcents/constants/colors.dart';

class TransactionCard extends StatelessWidget {
  const TransactionCard({super.key});

  @override
  Widget build(BuildContext context) {
    final List<String> transactionHistory = [
      'Grocery',
      'Electric Bill',
      'Book',
      'Internet Bill',
      'Lunch',
      'Credit Card Bill',
      'Shoes',
      'Keyboard',
      'Laptop',
      'Mechanical Keyboard',
    ];

    final List<String> prices = [
      '1500',
      '2300',
      '1200',
      '1800',
      '350',
      '8000',
      '2000',
      '500',
      '25000',
      '3000',
    ];

    return Container(
      margin: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: AppColors.buttonColor,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: Colors.black), // Black border
      ),
      child: Padding(
        padding: const EdgeInsets.only(
            top: 8, left: 8, right: 8, bottom: 16), // Padding for the card
        child: Column(
          crossAxisAlignment:
              CrossAxisAlignment.start, // Aligns text to the left
          mainAxisSize:
              MainAxisSize.min, // Allows the card to be as small as possible
          children: [
            ListTile(
              title: Text(
                'Transaction History',
                style: GoogleFonts.poppins(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(left: 10, right: 8),
              width: double.infinity,
              height: 190, // Height of the card
              decoration: BoxDecoration(
                border: Border.all(color: Colors.black),
              ),
              child: ListView.builder(
                itemCount: transactionHistory.length,
                itemBuilder: (ctx, index) {
                  return ListTile(
                    title: Text(
                      transactionHistory[index],
                      style: GoogleFonts.poppins(),
                    ),
                    trailing: Text(
                      '₱ ${prices[index]}',
                      style: GoogleFonts.montserrat(fontSize: 15),
                    ),
                  );
                },
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Align(
              alignment: Alignment.bottomRight,
              child: TextButton(
                onPressed: () {},
                child: const Text('View More'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
