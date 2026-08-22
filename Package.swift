// swift-tools-version: 6.3

import PackageDescription

let package = Package(
    name: "SmartAlarm",
    platforms: [
        .iOS(.v17)
    ],
    products: [
        .executable(name: "SmartAlarm", targets: ["SmartAlarm"])
    ],
    targets: [
        .executableTarget(
            name: "SmartAlarm",
            path: "SmartAlarm"
        )
    ]
)
