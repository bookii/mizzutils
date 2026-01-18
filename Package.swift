// swift-tools-version: 6.2

import PackageDescription

let package = Package(
    name: "mizzutils",
    platforms: [.iOS(.v18)],
    products: [
        .library(
            name: "mizzutils",
            targets: ["mizzutils"],
        ),
    ],
    targets: [
        .target(
            name: "mizzutils",
            swiftSettings: [.swiftLanguageMode(.v6)],
        ),
    ],
)
