// swift-tools-version: 5.9
import PackageDescription

let package = Package(
    name: "emulator_checker",
    platforms: [
        .iOS(.v12),
    ],
    products: [
        .library(name: "emulator_checker", targets: ["emulator_checker"])
    ],
    dependencies: [],
    targets: [
        .target(
            name: "emulator_checker",
            dependencies: [],
            path: "Sources/emulator_checker"
        )
    ]
)