# 📱 Emulator Checker

A **Flutter plugin** that detects whether an app is running on an **emulator** or a **real device**. This can be useful for **security measures**, **analytics**, and **feature flagging**, allowing developers to modify app behavior based on the runtime environment.

## 🛠 Installation

Add this to your `pubspec.yaml`:

```yaml
dependencies:
  emulator_checker: latest_version
```

Run:
```sh
flutter pub get
```

## 🚀 Features

✅ **Null safety** support  
✅ Detects if the app is running on an **emulator**  
✅ Supports **Android** and **iOS**  
✅ **Swift Package Manager (SPM)** support for iOS (Flutter 3.44+)  
✅ Lightweight and easy to use

## 🚀 Usage

Import the package:

```dart
import 'package:emulator_checker/emulator_checker.dart';
```

### Example: Detect if Running on an Emulator

```dart
void checkDevice() async {
  bool isEmulator = await EmulatorChecker().isEmulator();
  print(isEmulator ? "Running on an emulator" : "Running on a real device");
}
```

## 💡 Why Use Emulator Detection?
- **Security**: Prevent unauthorized access by blocking emulators.
- **Analytics**: Exclude emulator-based test data from analytics reports.
- **Feature Control**: Restrict certain app features for real devices only.

## ❤️ Support My Work

If you find this package useful, you can **[buy me a coffee](https://buymeacoffee.com/rhylvin)** to support development!

[![Buy Me a Coffee](https://img.shields.io/badge/Buy%20Me%20a%20Coffee-Support-orange?style=flat&logo=buy-me-a-coffee)](https://buymeacoffee.com/rhylvin)