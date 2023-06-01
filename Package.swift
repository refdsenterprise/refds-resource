// swift-tools-version: 5.8

import PackageDescription

let package = Package(
    name: "RefdsResource",
    defaultLocalization: "pt",
    products: [
        .library(
            name: "RefdsResource",
            targets: ["RefdsResource"]),
    ],
    dependencies: [
    ],
    targets: [
        .target(
            name: "RefdsResource",
            dependencies: [])
    ]
)
