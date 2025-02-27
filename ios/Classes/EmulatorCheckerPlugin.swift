import Flutter
import UIKit

public class EmulatorCheckerPlugin: NSObject, FlutterPlugin {
  public static func register(with registrar: FlutterPluginRegistrar) {
    let channel = FlutterMethodChannel(name: "emulator_checker", binaryMessenger: registrar.messenger())
    let instance = EmulatorCheckerPlugin()
    registrar.addMethodCallDelegate(instance, channel: channel)
  }

  public func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
    switch call.method {
    case "isEmulator":
      result(isEmulator())
    default:
      result(FlutterMethodNotImplemented)
    }
  }

  private func isEmulator() -> Bool {
    #if targetEnvironment(simulator)
    return true
    #else
    return false
    #endif
  }
}
