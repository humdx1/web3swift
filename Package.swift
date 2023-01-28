// swift-tools-version: 5.7
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "web3swift",
    products: [
        // Products define the executables and libraries a package produces, and make them visible to other packages.
        .library(
            name: "web3swift",
            targets: ["web3swift"]),
    ],
    dependencies: [
        .package(url: "https://github.com/Alamofire/Alamofire.git", from: "5.4.0"),
        .package(url: "https://github.com/mxcl/PromiseKit", from: "6.8.0"),
        .package(url: "https://github.com/attaswift/BigInt", from: "5.3.0"),
        .package(url: "https://github.com/antitypical/Result", exact: "4.0.1"),
        .package(url: "https://github.com/krzyzanowskim/CryptoSwift", from: "1.0.0"),
        .package(url: "https://github.com/humdx1/Sodium", branch: "master"),
        .package(url: "https://github.com/GigaBitcoin/secp256k1.swift.git", .upToNextMajor(from: "0.8.1")),
    ],
    targets: [
        // Targets are the basic building blocks of a package. A target can define a module or a test suite.
        // Targets can depend on other targets in this package, and on products in packages this package depends on.
        .target(
            name: "web3swift",
            dependencies: ["BigInt","Result","CryptoSwift", "PromiseKit", "Alamofire", .product(name: "secp256k1", package: "secp256k1.swift"), .product(name: "Clibsodium", package: "Sodium")],
            path: "Sources"),
        .testTarget(
            name: "web3swiftTests",
            dependencies: ["web3swift"]),
    ]
)
