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
        .package(name: "IDVModule", url: "https://github.com/regulaforensics/IDVModule-Swift-Package.git", .exact(Version(stringLiteral: "2.5.539"))),
        .package(name: "FaceSDK", url: "https://github.com/regulaforensics/FaceSDK-Swift-Package.git", .exact(Version(stringLiteral: "7.1.2790"))),
    ],
    targets: [
        .binaryTarget(name: "IDVFaceSDK", url: "https://pods.regulaforensics.com/IDVFaceSDK/2.5.762/IDVFaceSDK-2.5.762.zip", checksum: "dd3f3dd3fca322e8edbd3c4d8152f5d4e3af18f77e9f99fc1266f0b84b15f5e3"),
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
