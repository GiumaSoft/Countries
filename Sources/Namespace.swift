
import Foundation

/// An attempt to pursue MVVM design pattern togheter with Solid principles.
///
/// Enum are used as namespace container while struct represent individual concrete instances of View,
/// Model and ViewModel each one separated by each other and between other hierarchy components.
///
///
/// Top hierarchy container.
enum Org {
  /// Model container.
  ///
  /// All models that are not local or global states SHOULD be placed here.
  enum Model {
  }
  /// Network container.
  ///
  /// All entities that are responsible for network communication SHOULD be placed here.
  enum Network {
  }
  /// Routing container.
  ///
  /// All entities that are responsible for routing between views SHOULD be placed here.
  enum Routing {
  }
  /// Style container.
  ///
  /// All view modifiers and other styling functions SHOULD be placed here.
  enum Style {
    enum Modifier {
    }
  }
  /// Support container.
  ///
  /// All extensions and global functions SHOULD be placed here.
  enum Support {
    /// Extensions container
    enum Extension {
    }
  }
  /// UI container.
  ///
  /// All UI components and related View, ViewModel and LocalState SHOULD be placed here.
  enum UI {
    /// Countries container.
    enum Countries {
      /// Country container.
      enum Country {
      }
    }
  }

}
