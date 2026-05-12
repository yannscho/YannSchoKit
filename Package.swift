// swift-tools-version: 6.0
import PackageDescription

let package = Package(
    name: "YannSchoKit",
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
