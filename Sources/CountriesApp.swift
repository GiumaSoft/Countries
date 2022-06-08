
import SwiftUI

@main
struct CountriesApp: App {
    var body: some Scene {
        WindowGroup {
          NavigationView {
            Org.UI.Countries.View()
          }
        }
    }
}
