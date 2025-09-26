// swift-tools-version:5.3
import PackageDescription

let packageName = "IDVFaceSDK"

let package = Package(
    name: packageName,
    platforms: [.iOS(.v14)],
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
            from: "3.1.1203"
        ),
        .package(
            name: "FaceSDK",
            url: "https://github.com/regulaforensics/FaceSDK-Swift-Package.git",
            from: "7.2.3102"
        ),
    ],
    targets: [
        .binaryTarget(
            name: packageName,
            url: "https://pods.regulaforensics.com/\(packageName)/3.1.1703/\(packageName)-3.1.1703.zip",
            checksum: "8be82b8731492dbe9c1f166c8a9082eab1ce48f16c29f4703ee605cd22b8e8c4"
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
