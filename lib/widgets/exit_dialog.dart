import 'package:flutter/material.dart';
import 'package:flutter/services.dart'; // For SystemNavigator.pop()

class ShowBackDialog extends StatelessWidget {
  const ShowBackDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Exit'),
      content: const Text('Are you sure you want to exit the application?'),
      actions: <Widget>[
        TextButton(
          style: TextButton.styleFrom(
            textStyle: Theme.of(context).textTheme.labelLarge,
          ),
          child: const Text('Cancel'),
          onPressed: () => Navigator.pop(context, false),
        ),
        TextButton(
          style: TextButton.styleFrom(
            textStyle: Theme.of(context).textTheme.labelLarge,
          ),
          child: const Text('Exit', style: TextStyle(color: Colors.red)),
          onPressed: () => SystemNavigator.pop(),
        ),
      ],
    );
  }
}

Future<bool?> showBackDialog(BuildContext context) {
  return showDialog<bool>(
    barrierDismissible: false,
    context: context,
    builder: (BuildContext context) {
      return const ShowBackDialog();
    },
  );
}
