// swift-tools-version: 6.0
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "CoreUI",
    platforms: [
        .iOS(.v17)
    ],
    products: [
        .library(
            name: "CoreUI",
            targets: ["CoreUI"]),
    ],
    targets: [
        .target(
            name: "CoreUI"
        )
    ]
)
