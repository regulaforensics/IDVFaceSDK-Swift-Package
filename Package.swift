// swift-tools-version:5.5
import PackageDescription

let packageName = "IDVFaceSDK"
let binaryTargetName = "IDVFaceSDK"

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
            from: "3.10.2099"
        ),
        .package(
            name: "FaceSDK",
            url: "https://github.com/regulaforensics/FaceSDK-Swift-Package.git",
            from: "8.4.5062"
        ),
    ],
    targets: [
        .binaryTarget(
            name: binaryTargetName,
            url: "https://pods.regulaforensics.com/IDVFaceSDK/3.10.4076/IDVFaceSDK-3.10.4076.zip",
            checksum: "d6253fa03bd5e1a87609e26bbf71236ee413da0e2ee0851786cd3661275b3356"
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
