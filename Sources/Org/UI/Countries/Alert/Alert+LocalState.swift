
import Foundation

extension Org.UI.Alert {
  /// The local state model Alert view.
  struct LocalState {
    /// The message to be shown.
    let message: String
  }
}

// MARK: - Mute Init

extension Org.UI.Alert.LocalState {
  init() {
    self.message = "This is an alert example."
  }
}
