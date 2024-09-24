import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:permission_handler/permission_handler.dart';

class FinancialPlanning extends StatelessWidget {
  const FinancialPlanning({super.key});
  Future<void> downloadPdf(BuildContext context) async {
    if (Platform.isAndroid) {
      final permissionStatus = await Permission.manageExternalStorage.request();
      if (permissionStatus.isGranted) {
        try {
          final ByteData byteData = await rootBundle.load('assets/DARVIN.pdf');
          final Directory downloadDir =
              Directory('/storage/emulated/0/Download');

          if (!await downloadDir.exists()) {
            await downloadDir.create(recursive: true);
          }

          final String filePath = '${downloadDir.path}/sample.pdf';
          final File file = File(filePath);
          await file.writeAsBytes(byteData.buffer.asUint8List());

          if (context.mounted) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text('PDF downloaded to $filePath')),
            );
          }
        } catch (e) {
          if (context.mounted) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text('Error saving PDF: $e')),
            );
          }
        }
      } else {
        if (context.mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text(
                  'Please allow access so that the PDF can be downloaded.'),
            ),
          );
        }
      }
    } else {
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
              content: Text('This feature is only available on Android.')),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text(
            'Financial Planning',
          ),
        ),
        body: const Center(
          child: Column(
            children: [Text('Financial Planning is important :)')],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () => downloadPdf(context),
          child: const Icon(Icons.file_download),
        ),
      ),
    );
  }
}
