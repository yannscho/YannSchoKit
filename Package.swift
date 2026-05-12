// swift-tools-version: 6.0
import PackageDescription

let package = Package(
    name: "YannSchoKit",
    platforms: [
        .iOS(.v18),
        .macOS(.v14)
    ],
    products: [
        .library(name: "YannSchoConversions", targets: ["YannSchoConversions"]),
        .library(name: "YannSchoDates", targets: ["YannSchoDates"]),
        .library(name: "YannSchoUI", targets: ["YannSchoUI"]),
    ],
    targets: [
        .target(name: "YannSchoConversions"),
        .target(name: "YannSchoDates"),
        .target(name: "YannSchoUI"),
    ],
    swiftLanguageModes: [.v6]
)
