import ProjectDescription

let apolloScript = TargetScript.pre(
  path: Path.relativeToManifest("./Scripts/apollo-gen.sh"),
  name: "Run Script: Apollo"
)

let project = Project(
  name: "Countries",
  packages: [],
  targets: [
    Target(
        name: "Countries",
        platform: .iOS,
        product: .app,
        bundleId: "com.giumasoft.sample.Countries",
        deploymentTarget: .iOS(targetVersion: "15.0", devices: .iphone),
        infoPlist: .extendingDefault(
            with: [
                "UILaunchScreen": [:]
            ]
        ),
        sources: [
          "Sources/**/*.swift"
        ],
        scripts: [
          apolloScript
        ],
        dependencies: [
          .external(name: "Apollo")
        ],
        additionalFiles: [
          "Sources/**/*.json",
          "Sources/**/*.graphql"
        ]
    ),

    Target(
        name: "CountriesTests",
        platform: .iOS,
        product: .unitTests,
        bundleId: "com.giumasoft.example.CountriesTests",
        sources: ["Tests/Unit/**"],
        dependencies: [
            .target(name: "Countries")
        ]
    ),

  ],
  schemes: [],
  additionalFiles: [],
  resourceSynthesizers: []
)
