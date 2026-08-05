// swift-tools-version:5.3
import PackageDescription

let packageName = "IDVFaceSDK"

let package = Package(
    name: packageName,
    platforms: [
        .iOS(.v14)
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
            from: "3.9.1898"
        ),
        .package(
            name: "FaceSDK",
            url: "https://github.com/regulaforensics/FaceSDK-Swift-Package.git",
            from: "8.3.4725"
        ),
    ],
    targets: [
        .binaryTarget(
            name: packageName,
            url: "https://pods.regulaforensics.com/\(packageName)/3.9.3582/\(packageName)-3.9.3582.zip",
            checksum: "8c2867782509bcffa29abb8e2c6979be5a4d1c14effce8b440769af787bb675e"
        ),
        .target(
            name: "\(packageName)Common",
            dependencies: [
                .target(name: packageName),
                .product(name: "IDVModule", package: "IDVModule"),
                .product(name: "FaceSDK", package: "FaceSDK")
            ],
            path: "Sources",
            sources: ["dummy.swift"]
        )
    ]
)
