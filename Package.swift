// swift-tools-version: 6.3

import PackageDescription

let package = Package(
    name: "SmartAlarm",
    platforms: [
        .iOS(.v17)
    ],
    products: [
        .library(
            name: "SmartAlarm",
            targets: ["SmartAlarm"]
        )
    ],
    targets: [
        .target(
            name: "SmartAlarm",
            path: "."
        )
    ]
)
