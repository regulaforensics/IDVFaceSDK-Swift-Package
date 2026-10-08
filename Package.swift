// swift-tools-version:5.5
import PackageDescription

let packageName = "IDVFaceSDK"
let binaryTargetName = "IDVFaceSDKStage"

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
            from: "3.10.2024-rc"
        ),
        .package(
            name: "FaceSDK",
            url: "https://github.com/regulaforensics/FaceSDK-Swift-Package.git",
            from: "8.4.5062-rc"
        ),
    ],
    targets: [
        .binaryTarget(
            name: binaryTargetName,
            url: "https://pods.regulaforensics.com/Stage/IDVFaceSDKStage/3.10.3947/IDVFaceSDKStage-3.10.3947.zip",
            checksum: "d94c14ec5b3537bd4a6dc0b77b183ec96ae790b384c35dcce1f4aa7751796c4c"
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
