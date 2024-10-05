import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:smartcents/constants/colors.dart';

class BalanceCard extends StatelessWidget {
  const BalanceCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: Colors.black), // Black border
      ),
      child: Padding(
        padding: const EdgeInsets.only(
            top: 8, left: 16, right: 16, bottom: 16), // Padding for the card
        child: Column(
          crossAxisAlignment:
              CrossAxisAlignment.start, // Aligns text to the left
          mainAxisSize:
              MainAxisSize.min, // Allows the card to be as small as possible
          children: [
            ListTile(
              trailing: const CircleAvatar(
                radius: 30,
                backgroundColor: Colors.transparent,
                backgroundImage: AssetImage('./assets/images/coin.png'),
              ),
              contentPadding:
                  EdgeInsets.zero, // Removes default padding of ListTile
              leading: const Icon(Icons.account_balance_wallet,
                  color: Colors.black), // Optional icon
              title: Text(
                'Balance',
                style: GoogleFonts.poppins(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                    color: Colors.black),
              ),
              subtitle: const Text(
                'Current Account Balance', // Optional subtitle
                style: TextStyle(
                  fontSize: 12,
                  color: Colors.black,
                ),
              ),
            ),
            // Balance amount
            Text(
              '10,000 PHP',
              style: GoogleFonts.poppins(
                fontWeight: FontWeight.bold,
                fontSize: 24,
                color: Colors.black,
              ),
            ),
            const SizedBox(height: 16), // Space before limit text
            // Align widget to position the limit text at the bottom right
            const Align(
              alignment: Alignment.bottomRight,
              child: Text(
                'Limit: 15,000 PHP',
                style: TextStyle(
                  fontSize: 15,
                  color: Colors.black, // Grey color for the limit text
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
