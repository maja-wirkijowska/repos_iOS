//
//  Modifiers.swift
//  MCTravel
//
//  Created by Maja Wirkijowska on 7/18/22.
//

import SwiftUI

// MARK: - symbol
struct SymbolModifier: ViewModifier {
  func body(content: Content) -> some View {
    content
      .foregroundColor(.white)
      .font(.system(size: 128))
      .shadow(color: Color(UIColor(red: 0, green: 0, blue: 0, alpha: 0.2)), radius: 12, x: 0, y: 0)
  }
}

// MARK: - button
struct ButtonModifier: ViewModifier {
  func body(content: Content) -> some View {
    content
      .font(.headline)
      .padding()
      .frame(minWidth: 0, maxWidth: .infinity)
      .background(Capsule().fill(.pink))
      .foregroundColor(.white)
  }
}

// MARK: - title
struct TitleModifer: ViewModifier {
  func body(content: Content) -> some View {
    content
      .font(.largeTitle)
      .foregroundColor(.pink)
  }
}
