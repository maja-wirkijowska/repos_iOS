//
//  AppView.swift
//  Avocados
//
//  Created by Maja Wirkijowska on 7/7/22.
//

import SwiftUI

struct AppView: View {
  // MARK: - props
  
  // MARK: - body
  var body: some View {
    
    TabView {
      AvocadoView()
        .tabItem({
          Image("tabicon-branch")
          Text("Avocados")
        })
      ContentView()
        .tabItem({
          Image("tabicon-book")
          Text("Recipes")
        })
      RipeStagesView()
        .tabItem({
          Image("tabicon-avocado")
          Text("Ripeness Stages")
        })
      SettingsView()
        .tabItem({
          Image("tabicon-settings")
          Text("Settings")
        })
    } //: tab view
    .edgesIgnoringSafeArea(.top)
    .accentColor(.accentColor)
    
  } //: body
} //: struct

// MARK: - preview
struct AppView_Previews: PreviewProvider {
  static var previews: some View {
    Group {
      AppView()
        .preferredColorScheme(.light)
      AppView()
        .preferredColorScheme(.dark)
    }
  }
}
