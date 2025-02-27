import 'package:flutter/services.dart';

class EmulatorChecker {
  static const MethodChannel _channel = MethodChannel('emulator_checker');

  /// Returns `true` if the app is running on an emulator, `false` otherwise.
  static Future<bool> isEmulator() async {
    try {
      final bool result = await _channel.invokeMethod('isEmulator');
      return result;
    } on PlatformException {
      return false; // Default to false if an error occurs
    }
  }
}
