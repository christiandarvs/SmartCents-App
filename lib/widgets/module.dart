import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:permission_handler/permission_handler.dart';

class Module extends StatelessWidget {
  final String title;
  final String summary;
  final String fileName;

  const Module({
    super.key,
    required this.title,
    required this.summary,
    required this.fileName,
  });

  Future<void> downloadPdf(BuildContext context) async {
    if (Platform.isAndroid) {
      final permissionStatus = await Permission.manageExternalStorage.request();
      if (permissionStatus.isGranted) {
        try {
          final ByteData byteData = await rootBundle.load('assets/$fileName');
          final Directory downloadDir =
              Directory('/storage/emulated/0/Download');

          if (!await downloadDir.exists()) {
            await downloadDir.create(recursive: true);
          }

          final String filePath = '${downloadDir.path}/$fileName';
          final File file = File(filePath);
          await file.writeAsBytes(byteData.buffer.asUint8List());

          if (context.mounted) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                  showCloseIcon: true,
                  behavior: SnackBarBehavior.floating,
                  duration: const Duration(seconds: 4),
                  content: Text('PDF downloaded to $filePath')),
            );
          }
        } catch (e) {
          if (context.mounted) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                  showCloseIcon: true,
                  behavior: SnackBarBehavior.floating,
                  duration: const Duration(seconds: 4),
                  content: Text('Error saving PDF: $e')),
            );
          }
        }
      } else {
        if (context.mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              showCloseIcon: true,
              behavior: SnackBarBehavior.floating,
              duration: Duration(seconds: 4),
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
              showCloseIcon: true,
              behavior: SnackBarBehavior.floating,
              duration: Duration(seconds: 4),
              content: Text('This feature is only available on Android.')),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      onPopInvokedWithResult: (didPop, result) {
        ScaffoldMessenger.of(context).hideCurrentSnackBar();
      },
      child: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            centerTitle: true,
            title: Text(
              title,
            ),
          ),
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  summary,
                  style: const TextStyle(
                      fontSize: 16, fontWeight: FontWeight.w400),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: () => downloadPdf(context),
            child: const Icon(Icons.file_download),
          ),
        ),
      ),
    );
  }
}
