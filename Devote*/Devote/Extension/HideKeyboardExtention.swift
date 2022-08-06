//
//  HideKeyboardExtention.swift
//  Devote
//
//  Created by Maja Wirkijowska on 7/5/22.
//

import SwiftUI

#if canImport(UIKit)
extension View {
  func hideKeyboard() {
    UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
  }
}
#endif
