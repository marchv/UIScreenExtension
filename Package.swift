// swift-tools-version:5.2

import PackageDescription

let package = Package(
    name: "UIScreenExtension",
    platforms: [
        .iOS(SupportedPlatform.IOSVersion.v9),
    ],
    products: [
        .library(
            name: "UIScreenExtension",
            targets: ["UIScreenExtension"]),
    ],
    dependencies: [],
    targets: [
        .target(
            name: "UIScreenExtension",
            dependencies: []),
    ]
)
