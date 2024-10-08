import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:smartcents/providers/budget_provider.dart';

class BudgetInputScreen extends StatelessWidget {
  const BudgetInputScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          title: const Text('Add Transaction'),
        ),
        body: Column(
          children: [
            const SizedBox(height: 10),
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text('Item Name'),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Consumer<BudgetProvider>(
                builder: (context, budgetProvider, child) {
                  return TextField(
                    textInputAction: TextInputAction.next,
                    keyboardType: TextInputType.text,
                    decoration: const InputDecoration(
                      // labelText: 'Item Name',
                      border: OutlineInputBorder(),
                    ),
                    onChanged: (value) {
                      budgetProvider.setItemName(value);
                    },
                  );
                },
              ),
            ),
            const SizedBox(height: 20),
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text('Amount'),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Consumer<BudgetProvider>(
                builder: (context, budgetProvider, child) {
                  return TextField(
                    decoration: const InputDecoration(
                      // labelText: 'Amount',
                      border: OutlineInputBorder(),
                    ),
                    keyboardType: TextInputType.number,
                    onChanged: (value) {
                      budgetProvider.setAmount(value);
                    },
                  );
                },
              ),
            ),
            const SizedBox(height: 15),
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text('Category'),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8),
              child: Consumer<BudgetProvider>(
                builder: (context, budgetProvider, child) {
                  return DropdownButton<String>(
                    value: budgetProvider.category,
                    onChanged: (value) {
                      if (value != null) {
                        budgetProvider.setCategory(value);
                      }
                    },
                    items: const [
                      DropdownMenuItem(value: 'Food', child: Text('Food')),
                      DropdownMenuItem(
                          value: 'Transport', child: Text('Transport')),
                      DropdownMenuItem(
                          value: 'Entertainment', child: Text('Entertainment')),
                      DropdownMenuItem(
                          value: 'Utilities', child: Text('Utilities')),
                      DropdownMenuItem(value: 'Health', child: Text('Health')),
                    ],
                  );
                },
              ),
            ),
          ],
        ),
        floatingActionButton: Consumer<BudgetProvider>(
          builder: (context, budgetProvider, child) {
            return FloatingActionButton(
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(
                        'Item: ${budgetProvider.itemName}, Amount: ${budgetProvider.amount}, Category: ${budgetProvider.category}'),
                    behavior: SnackBarBehavior.floating,
                  ),
                );
                budgetProvider.submitData();
              },
              child: const Icon(Icons.add),
            );
          },
        ),
      ),
    );
  }
}
