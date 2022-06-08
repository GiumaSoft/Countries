
import Foundation

extension Org.UI.Countries {
  /// The local state model for countries view.
  struct LocalState {
    /// The list of countries.
    var countries: [Org.Model.Country]
    /// Route to destination if true.
    var isActive: Bool
    /// The navigation destination.
    var destination: Org.Routing.NavigationDestination?
  }
}

// MARK: - Mute Init

extension Org.UI.Countries.LocalState {
  /// Mute init for default initialization.
  init() {
    self.init(
      countries: [],
      isActive: false,
      destination: nil
    )
  }
}

