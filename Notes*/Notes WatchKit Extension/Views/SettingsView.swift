//
//  SettingsView.swift
//  Notes WatchKit Extension
//
//  Created by Maja Wirkijowska on 7/6/22.
//

import SwiftUI

struct SettingsView: View {
  // MARK: - props
  @AppStorage("lineCount") var lineCount: Int = 1
  @State private var value: Float = 1.0
  
  // MARK: - functions
  func update() {
    lineCount = Int(value)
  }
  
  // MARK: - body
  var body: some View {
    
    VStack(spacing: 8) {
      // header
      HeaderView(title: "settings")
      
      // line count
      Text("Lines: \(lineCount)".uppercased())
        .fontWeight(.bold)
      
      // slider
      Slider(value: Binding(get: {
        self.value
      }, set: {(newValue) in
        self.value = newValue
        self.update()
      }), in: 1 ... 4, step: 1)
        .accentColor(.accentColor)
      
    } //: vstack
    
  }
}

struct SettingsView_Previews: PreviewProvider {
  static var previews: some View {
    SettingsView()
  }
}
