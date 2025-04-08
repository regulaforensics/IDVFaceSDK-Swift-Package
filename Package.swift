// swift-tools-version:5.3
import PackageDescription

let packageName = "IDVFaceSDK"

let package = Package(
    name: "IDVFaceSDK",
    platforms: [.iOS(.v13)],
    products: [
        .library(
            name: "IDVFaceSDK",
            targets: ["\(packageName)Common"]),
    ],
    dependencies: [
        .package(name: "IDVModule", url: "https://github.com/regulaforensics/IDVModule-Swift-Package.git", .exact(Version(stringLiteral: "0.1.118"))),
        .package(name: "FaceSDK", url: "https://github.com/regulaforensics/FaceSDK-Swift-Package.git", .exact(Version(stringLiteral: "6.4.2453"))),
    ],
    targets: [
        .binaryTarget(name: "IDVFaceSDK", url: "https://pods.regulaforensics.com/IDVFaceSDK/2.3.333/IDVFaceSDK-2.3.333.zip", checksum: "e1c32563f357c76ec2e46b86eec5bff07e37628b45dda640f300addb5c47f0fd"),
        .target(
            name: "\(packageName)Common",
            dependencies: [
                .target(name: "IDVFaceSDK"),
                .product(name: "IDVModule", package: "IDVModule"),
                .product(name: "FaceSDK", package: "FaceSDK")
            ],
            path: "Sources",
            sources: ["dummy.swift"]
        )
    ]
)
