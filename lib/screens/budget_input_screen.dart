import 'package:flutter/material.dart';

class BudgetInputScreen extends StatelessWidget {
  const BudgetInputScreen({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController itemName = TextEditingController();
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset:
            false, // Prevent FAB from moving when keyboard appears
        appBar: AppBar(
          title: const Text('Budget Input'),
        ),
        body: const Column(
          children: [
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: EdgeInsets.all(8.0),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text('Item Name'),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(right: 20, left: 20, top: 20),
              child: TextField(
                textInputAction: TextInputAction.next,
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                  labelText: 'Item Name',
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: EdgeInsets.all(8.0),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text('Item Name'),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(right: 20, left: 20, top: 20),
              child: TextField(
                decoration: InputDecoration(
                  labelText: 'Amount',
                  border: OutlineInputBorder(),
                ),
                keyboardType: TextInputType.number,
              ),
            ),
            SizedBox(height: 15),
            Padding(
              padding: EdgeInsets.all(8.0),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text('Category'),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(8),
              child: DropdownMenu(
                label: Text('Category'),
                initialSelection: 'Food',
                dropdownMenuEntries: [
                  DropdownMenuEntry(value: 'Food', label: 'Food'),
                  DropdownMenuEntry(value: 'Transport', label: 'Transport'),
                  DropdownMenuEntry(
                      value: 'Entertainment', label: 'Entertainment'),
                  DropdownMenuEntry(value: 'Utilities', label: 'Utilities'),
                  DropdownMenuEntry(value: 'Health', label: 'Health'),
                ],
                width: 200,
              ),
            ),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text('data'),
                behavior: SnackBarBehavior.floating,
              ),
            );
            debugPrint(itemName.text);
          },
          child: const Icon(Icons.add),
        ),
      ),
    );
  }
}
