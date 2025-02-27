import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:emulator_checker/emulator_checker.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  const MethodChannel channel = MethodChannel('emulator_checker');

  setUp(() {
    TestDefaultBinaryMessengerBinding.instance?.defaultBinaryMessenger
        .setMockMethodCallHandler(channel, (MethodCall methodCall) async {
      if (methodCall.method == 'isEmulator') {
        return true; // Simulating an emulator
      }
      return false;
    });
  });

  tearDown(() {
    TestDefaultBinaryMessengerBinding.instance?.defaultBinaryMessenger
        .setMockMethodCallHandler(channel, null);
  });

  test('should return true when running on an emulator', () async {
    final bool isEmulator = await EmulatorChecker.isEmulator();
    expect(isEmulator, true);
  });

  test('should return false when running on a physical device', () async {
    TestDefaultBinaryMessengerBinding.instance?.defaultBinaryMessenger
        .setMockMethodCallHandler(channel, (MethodCall methodCall) async {
      return false; // Simulating a physical device
    });

    final bool isEmulator = await EmulatorChecker.isEmulator();
    expect(isEmulator, false);
  });

  test('should handle PlatformException and return false', () async {
    TestDefaultBinaryMessengerBinding.instance?.defaultBinaryMessenger
        .setMockMethodCallHandler(channel, (MethodCall methodCall) async {
      throw PlatformException(code: 'ERROR', message: 'Platform error');
    });

    final bool isEmulator = await EmulatorChecker.isEmulator();
    expect(isEmulator, false);
  });
}
