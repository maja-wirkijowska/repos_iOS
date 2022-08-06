//
//  CenterMod.swift
//  Africa
//
//  Created by Maja Wirkijowska on 6/30/22.
//

import SwiftUI

struct CenterMod: ViewModifier {
  func body(content: Content) -> some View {
    HStack {
      Spacer()
      content
      Spacer()
    }
  }
}
