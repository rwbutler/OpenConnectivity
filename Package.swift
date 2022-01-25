// swift-tools-version:5.1
import PackageDescription

let package = Package(
    name: "OpenConnectivity",
    platforms: [
        .iOS(.v9),
        .tvOS(.v9),
        .macOS(.v10_10)
    ],
    products: [
        .library(
            name: "OpenConnectivity",
            targets: ["OpenConnectivity"]
        )
    ],
    dependencies: [
        .package(
            url: "https://github.com/OpenCombine/OpenCombine",
            from: "0.12.0"
        ),
        .package(
            url: "https://github.com/rwbutler/Connectivity",
            from: "5.0.0"
        )
    ],
    targets: [
        .target(
            name: "OpenConnectivity",
            dependencies: ["OpenCombine", "Connectivity"],
            path: "code"
        )
    ]
)

