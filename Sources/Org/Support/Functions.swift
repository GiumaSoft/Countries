
import SwiftUI

/// Conditional statement that return a view content if value is not nil.
///
/// - Parameters:
///   - value: Any optional value.
///   - content: The view content to be returned.
/// - Returns: An optional content that is nil if value is nil.
func If<Value, Content: View>(_ value: Value?, @ViewBuilder content: (Value) -> Content) -> Content? {
  value != nil ? content(value!) : nil
}

/// Conditional statement that return a view content if value is an empty array.
///
/// - Parameters:
///   - value: An array of value.
///   - content: The view content to be returned.
/// - Returns: An optional content that is nil if the array is empty.
func If<Value, Content: View>(_ elements: Array<Value>, @ViewBuilder content: (Array<Value>) -> Content) -> Content? {
  elements.count > 0 ? content(elements) : nil
}
