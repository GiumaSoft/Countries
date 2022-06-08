
import SwiftUI

extension Org.Routing {
  /// Manage the routing from a view to another.
  enum NavigationDestination {
    /// The countries view destination.
    case countries
    /// The country details view destination.
    case country(Org.Model.Country)
  }
}

extension Org.Routing.NavigationDestination {
  /// Represent which way a view should be presented
  enum PresentationMode {
    /// View presented from bottom with blur effect are `.modal`
    case modal
    /// View sliding in from right to left are `.show`
    case show
  }
  
  /// Return the preset presentationMode for the destination view.
  var present: PresentationMode {
    switch self {
    case .countries:
      return .show
    case .country(_):
      return .modal
    }
  }
}

/// Return a concrete view based on enum value.
extension Org.Routing.NavigationDestination: SwiftUI.View {
  var body: some SwiftUI.View {
    switch self {
    case .countries:
      Org.UI.Countries.View()
    case .country(let country):
      Org.UI.Countries.Country.View(
        state: .init(
          country: country
        )
      )
    }
  }
}
