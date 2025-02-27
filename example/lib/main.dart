import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:emulator_checker/emulator_checker.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String _deviceStatus = 'Checking...';
  final _emulatorCheckerPlugin = EmulatorChecker();

  @override
  void initState() {
    super.initState();
    checkIfEmulator();
  }

  Future<void> checkIfEmulator() async {
    try {
      bool isEmulator = await EmulatorChecker.isEmulator();
      if (!mounted) return;
      setState(() {
        _deviceStatus = isEmulator
            ? 'Running on an Emulator'
            : 'Running on a Physical Device';
      });
    } on PlatformException {
      if (!mounted) return;
      setState(() {
        _deviceStatus = 'Failed to check emulator status';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Emulator Checker Example'),
        ),
        body: Center(
          child: Text(
            _deviceStatus,
            style: const TextStyle(fontSize: 18),
          ),
        ),
      ),
    );
  }
}
