
import SwiftUI

extension Org.UI.Countries.Country {
  /// The view model for country view.
  struct ViewModel {
    /// Get plural or simple verb based on int value.
    ///
    /// - Parameters:
    ///   - value: An array of  value.
    ///   - content: View to be returned.
    /// - Returns: A view is returned depending if value count > 1.
    static func simpleOrPlural<Value, Content: SwiftUI.View>(_ value: Array<Value>, simple: () -> Content, plural: () -> Content) -> Content {
      value.count > 1 ? plural() : simple()
    }
  }
}
