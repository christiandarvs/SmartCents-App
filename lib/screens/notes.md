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



Starting device daemon...
[ERR] Error 1 retrieving device properties for Infinix X6711:
[ERR] adb.exe: device offline

[ERR] The Android emulator exited with code 1 after startup
[ERR] Android emulator stderr:
[ERR] added library vulkan-1.dll
[ERR] initialize: Supports id properties, got a vulkan device UUID
[ERR] netsimd I 10-06 12:10:43.278 daemon\src\rust_main.rs:98 - netsim artifacts path: "C:\\Users\\Chris\\AppData\\Local\\Temp\\netsimd"
[ERR] netsimd I 10-06 12:10:43.279 daemon\src\rust_main.rs:101 - NetsimdArgs {
[ERR]     fd_startup_str: None,
[ERR]     no_cli_ui: true,
[ERR]     no_web_ui: true,
[ERR]     pcap: false,
[ERR]     disable_address_reuse: false,
[ERR]     hci_port: None,
[ERR]     connector_instance: None,
[ERR]     instance: None,
[ERR]     logtostderr: false,
[ERR]     dev: false,
[ERR]     disable_wifi_p2p: false,
[ERR]     rust_grpc: false,
[ERR]     vsock: None,
[ERR]     config: None,
[ERR]     host_dns: Some(
[ERR]         "192.168.254.254",
[ERR]     ),
[ERR]     http_proxy: None,
[ERR]     test_beacons: false,
[ERR]     no_test_beacons: false,
[ERR]     no_shutdown: false,
[ERR]     verbose: false,
[ERR]     version: false,
[ERR] }
[ERR] WARNING | The emulator now requires a signed jwt token for gRPC access! Use the -grpc flag if you really want an open unprotected grpc port
[ERR] WARNING | *** Basic token auth should only be used by android-studio ***
[ERR] WARNING | Cold boot: requested by the user
[ERR] Address these issues and try again.
[ERR] Error 1 retrieving device properties for sdk gphone64 x86 64:
[ERR] adb.exe: device 'emulator-5554' not found