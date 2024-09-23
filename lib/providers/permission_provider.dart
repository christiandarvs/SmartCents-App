import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';

class PermissionProvider extends ChangeNotifier {
  bool _isPermissionGranted = false;

  bool get isPermissionGranted => _isPermissionGranted;

  Future<void> requestStoragePermission() async {
    DeviceInfoPlugin deviceInfoPlugin = DeviceInfoPlugin();
    AndroidDeviceInfo androidInfo = await deviceInfoPlugin.androidInfo;

    if (androidInfo.version.sdkInt < 33) {
      if (await Permission.storage.request().isGranted) {
        _isPermissionGranted = true;
      } else {
        _isPermissionGranted = false;
        if (await Permission.storage.isPermanentlyDenied) {
          await openAppSettings();
        }
      }
    } else {
      if (await Permission.photos.request().isGranted) {
        _isPermissionGranted = true;
      } else {
        _isPermissionGranted = false;
        if (await Permission.photos.isPermanentlyDenied) {
          await openAppSettings();
        }
      }
    }
    notifyListeners();
  }
}
