// swift-tools-version:5.5
import PackageDescription

let packageName = "IDVFaceSDK"
let binaryTargetName = "IDVFaceSDKNightly"

let package = Package(
    name: packageName,
    platforms: [
        .iOS(.v15)
    ],
    products: [
        .library(
            name: packageName,
            targets: ["\(packageName)Common"]
        ),
    ],
    dependencies: [
        .package(
            name: "IDVModule",
            url: "https://github.com/regulaforensics/IDVModule-Swift-Package.git",
            from: "4.0.2151-nightly"
        ),
        .package(
            name: "FaceSDK",
            url: "https://github.com/regulaforensics/FaceSDK-Swift-Package.git",
            from: "8.5.5343-nightly"
        ),
    ],
    targets: [
        .binaryTarget(
            name: binaryTargetName,
            url: "https://pods.regulaforensics.com/Nightly/IDVFaceSDKNightly/4.0.4219/IDVFaceSDKNightly-4.0.4219.zip",
            checksum: "d879a6f7189a4f976a4dde0e61a506d65437495d5068a50abdde0973645bbdc9"
        ),
        .target(
            name: "\(packageName)Common",
            dependencies: [
                .target(name: binaryTargetName),
                .product(name: "IDVModule", package: "IDVModule"),
                .product(name: "FaceSDK", package: "FaceSDK")
            ],
            path: "Sources",
            sources: ["dummy.swift"]
        )
    ]
)
