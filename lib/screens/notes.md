 // Expanded(
          //   child: ListView.builder(
          //     itemCount: budgetProvider.items.length,
          //     itemBuilder: (context, index) {
          //       final item = budgetProvider.items[index];
          //       return ListTile(
          //         title: Text(item.name),
          //         subtitle: Text('\$${item.amount.toStringAsFixed(2)}'),
          //         trailing: IconButton(
          //           icon: const Icon(Icons.delete),
          //           onPressed: () => budgetProvider.removeItem(index),
          //         ),
          //       );
          //     },
          //   ),
          // ),
          // Padding(
          //   padding: const EdgeInsets.all(8.0),
          //   child: Row(
          //     children: [
          //       Expanded(
          //         child: TextField(
          //           controller: _nameController,
          //           decoration: const InputDecoration(labelText: 'Item Name'),
          //         ),
          //       ),
          //       Expanded(
          //         child: TextField(
          //           controller: _amountController,
          //           decoration: const InputDecoration(labelText: 'Amount'),
          //           keyboardType: TextInputType.number,
          //         ),
          //       ),
          //       IconButton(
          //         icon: const Icon(Icons.add),
          //         onPressed: () {
          //           final name = _nameController.text;
          //           final amount = double.tryParse(_amountController.text) ?? 0;
          //           if (name.isNotEmpty && amount > 0) {
          //             budgetProvider.addItem(name, amount);
          //             _nameController.clear();
          //             _amountController.clear();
          //           }
          //         },
          //       ),
          //     ],
          //   ),
          // ),
          // Padding(
          //   padding: const EdgeInsets.all(8.0),
          //   child: Text(
          //     'Total: \$${budgetProvider.totalBudget.toStringAsFixed(2)}',
          //     style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          //   ),
          // ),