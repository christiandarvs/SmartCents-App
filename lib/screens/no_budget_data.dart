import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class NoBudgetDataScreen extends StatelessWidget {
  const NoBudgetDataScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Please enter data for the budget tracker',
            textAlign: TextAlign.center,
            style:
                GoogleFonts.poppins(fontWeight: FontWeight.bold, fontSize: 20),
          ),
          const SizedBox(
            height: 25,
          ),
          ElevatedButton(onPressed: () {}, child: const Text('Start Now'))
        ],
      ),
    );
  }
}
