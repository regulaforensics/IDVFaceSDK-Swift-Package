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
            from: "4.0.2134-nightly"
        ),
        .package(
            name: "FaceSDK",
            url: "https://github.com/regulaforensics/FaceSDK-Swift-Package.git",
            from: "8.5.5278-nightly"
        ),
    ],
    targets: [
        .binaryTarget(
            name: binaryTargetName,
            url: "https://pods.regulaforensics.com/Nightly/IDVFaceSDKNightly/4.0.4166/IDVFaceSDKNightly-4.0.4166.zip",
            checksum: "ae5cbba4e005cfcd7dc6de972526c328270ea587101880c87bc3bfd86b8f3918"
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
