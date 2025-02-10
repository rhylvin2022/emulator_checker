import 'package:device_info_plus/device_info_plus.dart';
import 'package:get_radio_version_plugin/get_radio_version_plugin.dart';
import 'dart:io';

/// Checks if you are awesome. Spoiler: you are.
class Awesome {
  bool get isAwesome => true;
}

/// Checks if app is currently in Emulator or Not
/// True if Emulator
/// False if Physical Device.
class EmulatorChecker {
  Future<bool> isEmulator() async {
    final deviceInfoPlugin = DeviceInfoPlugin();

    if (Platform.isAndroid) {
      AndroidDeviceInfo androidInfo = await deviceInfoPlugin.androidInfo;
      bool androidEmulator = false;

      /// Checking for known android emulator properties
      if ((androidInfo.fingerprint.contains("generic")) ||
          (androidInfo.model.contains("Emulator")) ||
          (androidInfo.manufacturer.contains("Genymotion")) ||
          (androidInfo.hardware.contains("goldfish")) ||
          (androidInfo.brand.contains("generic")) ||
          (androidInfo.product.contains("google_sdk")) ||
          (androidInfo.product.contains("simulator")) ||
          (androidInfo.fingerprint.contains("unknown")) ||
          (androidInfo.hardware.contains("ranchu")) ||
          (androidInfo.model.contains("Android SDK built for x86")) ||
          (androidInfo.product.contains("sdk_google")) ||
          (androidInfo.product.contains("sdk")) ||
          (androidInfo.product.contains("sdk_x86")) ||
          (androidInfo.product.contains("sdk_gphone64_arm64")) ||
          (androidInfo.product.contains("vbox86p")) ||
          (androidInfo.product.contains("emulator"))) {
        androidEmulator = true;
      }

      ///check if actual Physical Device
      if (!androidEmulator) {
        androidEmulator = !(androidInfo.isPhysicalDevice);
      }

      ///check for radio version
      ///Radio firmware version of the device as a String,
      ///typically for devices that include cellular radios.
      ///This is sometimes used to identify emulators because emulators
      ///often return a basic or default radio version,
      ///such as "1.0.0.0", while physical devices have
      ///unique or non-default values.
      if (!androidEmulator) {
        String radioVersion =
            await GetRadioVersionPlugin.radioVersion ?? 'Unknown radio version';
        if (radioVersion == '1.0.0.0' || radioVersion == '') {
          ///Emulator
          androidEmulator = true;
        }
      }

      return androidEmulator;
    } else if (Platform.isIOS) {
      IosDeviceInfo iosInfo = await deviceInfoPlugin.iosInfo;
      return !(iosInfo.isPhysicalDevice);
    }

    return false;

    /// It's a physical device
  }
}
