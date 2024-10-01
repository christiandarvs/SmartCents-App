import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:smartcents/constants/colors.dart';
import 'package:smartcents/providers/theme_provider.dart';

class Settings extends StatelessWidget {
  const Settings({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Settings'),
        ),
        body: Column(
          children: [
            Card(
              child: ListTile(
                title: const Text('Dark Mode'),
                trailing: Switch(
                  activeColor: AppColors.buttonColor,
                  value: Provider.of<ThemeProvider>(context).themeMode ==
                      ThemeMode.dark,
                  onChanged: (value) {
                    Provider.of<ThemeProvider>(context, listen: false)
                        .toggleTheme();
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
