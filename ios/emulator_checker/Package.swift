// swift-tools-version: 5.9
import PackageDescription

let package = Package(
    name: "emulator_checker",
    platforms: [
        .iOS(.v12),
    ],
    products: [
        .library(name: "emulator-checker", targets: ["emulator_checker"])
    ],
    dependencies: [
        .package(name: "FlutterFramework", path: "../FlutterFramework")
    ],
    targets: [
        .target(
            name: "emulator_checker",
            dependencies: [
                .product(name: "FlutterFramework", package: "FlutterFramework")
            ],
            path: "Sources/emulator_checker"
        )
    ]
)