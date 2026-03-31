// swift-tools-version: 5.9
import PackageDescription

let package = Package(
    name: "XColor",
    platforms: [
        .iOS(.v16),
        .watchOS(.v9),
        .tvOS(.v16),
        .macOS(.v13),
        .visionOS(.v1)
    ],
    products: [
        .library(name: "XColor", targets: ["XColor"])
    ],
    targets: [
        .target(
            name: "XColor",
            path: "Source",
            exclude: ["Supporting Files"]
        ),
        .testTarget(
            name: "XColorTests",
            dependencies: ["XColor"],
            path: "XColorTests",
            exclude: ["Info.plist"]
        )
    ]
)
