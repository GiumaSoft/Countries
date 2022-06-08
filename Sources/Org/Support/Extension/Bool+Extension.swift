//
//  Bool+Extensions.swift
//  Countries
//
//  Created by Giuseppe Mazzilli on 09/06/22.
//

import Foundation

extension Bool {
  /// Represent an elegant alternative to `!=` statement for boolean values.
  var isFalse: Bool {
    !self
  }
}
