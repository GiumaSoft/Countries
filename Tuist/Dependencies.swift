import ProjectDescription

let dependecies = Dependencies(
  carthage: nil,
  swiftPackageManager: [
    .package(url: "https://github.com/apollographql/apollo-ios.git", .upToNextMinor(from: "0.51.2"))
  ],
  platforms: [.iOS]
)
