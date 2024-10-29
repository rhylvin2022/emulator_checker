import 'package:emulator_checker/emulator_checker.dart';

void main() {
  var awesome = Awesome();
  print('awesome: ${awesome.isAwesome}');
  print('EmulatorChecker: ${EmulatorChecker().isEmulator()}');
}
