//
//  CheckBoxStyleToggle.swift
//  Demo
//
//  Created by Maja Wirkijowska on 7/8/22.
//

import SwiftUI

struct CheckBoxStyleToggle: ToggleStyle {

  func makeBody(configuration: Configuration) -> some View {
    return HStack {
      Image(systemName: configuration.isOn ? "checkmark.circle.fill" : "circle")
        .foregroundColor(blueDark)
        .font(.system(size: 40, weight: .semibold, design: .rounded))
        .onTapGesture {
          configuration.isOn.toggle()
        }
    }
  }
}

struct CheckBoxSmallStyleToggle: ToggleStyle {

  func makeBody(configuration: Configuration) -> some View {
    return HStack {
      Image(systemName: configuration.isOn ? "checkmark.circle.fill" : "circle")
        
        .font(.system(size: 25, weight: .light, design: .rounded))
        .onTapGesture {
          configuration.isOn.toggle()
        }
    }
  }
}

struct CheckBoxStyleToggle_Previews: PreviewProvider {
  static var previews: some View {
    Toggle("Placeholder", isOn: .constant(false))
      .toggleStyle(CheckBoxStyleToggle())
      .padding()
      .previewLayout(.sizeThatFits)
  }
}
