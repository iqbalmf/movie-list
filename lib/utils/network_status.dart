import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class NetworkStatus {
  static const _platform = MethodChannel('network-status');

  static Future<bool> isNetworkOnline() async {
    try {
      final bool status = await _platform.invokeMethod('isNetworkOnline');
      return status;
    } on PlatformException catch (e) {
      if (kDebugMode) {
        print("Failed to get network status: ${e.message}");
      }
      return false;
    }
  }
}
