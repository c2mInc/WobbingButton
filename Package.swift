// swift-tools-version:4.0

import PackageDescription

let package = Package(
    name: "WobbingButton",
    dependencies: [
        .package(url: "WobbingButton/Classes", .branch("master")),
    ],
    targets: [
        .target(
            name: "WobbingButton",
            dependencies: ["my-lib"]
        ),
    ]
)