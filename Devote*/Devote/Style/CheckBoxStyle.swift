//
//  CheckBoxStyle.swift
//  Devote
//
//  Created by Maja Wirkijowska on 7/5/22.
//

import SwiftUI

struct CheckBoxStyle: ToggleStyle {
  // MARK: - props
  
  // MARK: - funcs
  func makeBody(configuration: Configuration) -> some View {
    return HStack {
      Image(systemName: configuration.isOn ? "checkmark.circle.fill" : "circle")
        .foregroundColor(configuration.isOn ? .pink : .primary)
        .font(.system(size: 30, weight: .semibold, design: .rounded))
        .onTapGesture {
          configuration.isOn.toggle()
          feedback.notificationOccurred(.success)
          
          if (configuration.isOn) {
            playSound(sound: "sound-rise", type: "mp3")
          } else {
            playSound(sound: "sound-tap", type: "mp3")
          } //: else
        } //: onTapGesture
      
      configuration.label
    } //: hstack
    
  } //: makeBody()

}

// MARK: - preview
struct CheckBoxStyle_Previews: PreviewProvider {
  static var previews: some View {
    Toggle("Placeholder", isOn: .constant(false))
      .toggleStyle(CheckBoxStyle())
      .padding()
      .previewLayout(.sizeThatFits)
  }
}
