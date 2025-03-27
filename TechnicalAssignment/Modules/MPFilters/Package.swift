// swift-tools-version: 6.0
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "MPFilters",
    platforms: [
        .iOS(.v17)
    ],
    products: [
        // Products define the executables and libraries a package produces, making them visible to other packages.
        .library(
            name: "MPFilters",
            targets: ["MPFilters"]),
    ],
    dependencies: [
        .package(url: "https://github.com/MetalPetal/MetalPetal.git", from: "1.25.2")
    ],
    targets: [
        .target(
            name: "MPFilters",
            dependencies: [
                .product(name: "MetalPetal", package: "MetalPetal")
            ]
        ),
        .testTarget(
            name: "MPFiltersTests",
            dependencies: ["MPFilters"],
            resources: [
                .process("Resources")
            ]
        ),
    ]
)
