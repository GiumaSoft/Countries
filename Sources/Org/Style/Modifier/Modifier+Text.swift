
import SwiftUI

extension Org.Style.Modifier {
  /// View modifier should apply to `Text` to make `string appear as a tag element`.
  struct TagElement: ViewModifier {
    func body(content: Content) -> some View {
      content
        .padding()
        .background(
          Color(
            uiColor: .systemGray6
          )
        )
        .clipShape(
          Capsule()
        )
    }
  }
  
  /// View modifier should apply to `Text`  to make  `glyph or emoji appear as a large icon`.
  struct LargeEmoji: ViewModifier {
    func body(content: Content) -> some View {
      content
        .font(
          .system(
            size: 72
          )
        )
    }
  }

  /// View modifier should apply to `Text`to make `string appear as an heading title`.
  struct Heading: ViewModifier {
    func body(content: Content) -> some View {
      content
        .font(
          .system(
            size: 24,
            weight: .bold,
            design: .default
          )
        )
    }
  }

  /// View modifier should apply to `Text` to make a `glyph or emoji appear as a medium icon`.
  struct MediumEmoji: ViewModifier {
    func body(content: Content) -> some View {
      content
        .font(
          .system(
            size: 48
          )
        )
    }
  }

  /// View modifier should apply to `Text` to make a `string appear as a title`.
  struct Title: ViewModifier {
    func body(content: Content) -> some View {
      content
        .font(
          .system(
            size: 72
          )
        )
    }
  }

  /// View modifier should apply to `Divide` to make `appear as a line`.
  struct StandardDivider: ViewModifier {
    func body(content: Content) -> some View {
      content
        .frame(height: 0.5)
        .background(
          Color(uiColor: .lightText)
        )
    }
  }

  /// View modifier should apply to `List` item to make `appear with no separator and no insets`.
  ///
  struct DefaultListItem: ViewModifier {
    func body(content: Content) -> some View {
      content
        .listRowSeparator(.hidden)
        .listRowBackground(Color.clear)
        .listRowInsets(
          EdgeInsets(.zero)
        )
    }
  }

}
