//
//  SettingsView.swift
//  Avocados
//
//  Created by Maja Wirkijowska on 7/7/22.
//

import SwiftUI

struct SettingsView: View {
  // MARK: - props
  @State private var enableNotification: Bool = true
  @State private var backgroundRefresh: Bool = false
  
  // MARK: - body
  var body: some View {
    
    VStack(alignment: .center, spacing: 0) {
      
      // MARK: - header
      VStack(alignment: .center, spacing: 5) {
        Image("avocado")
          .resizable()
          .scaledToFit()
          .padding(.top)
          .frame(width: 100, height: 100, alignment: .center)
          .shadow(color: blackLight, radius: 8, x: 0, y: 4)
        
        Text("Avocados".uppercased())
          .font(.system(.title, design: .serif))
          .fontWeight(.bold)
        .foregroundColor(greenAdaptive)
      }
      .padding()
      
      Form {
        // MARK: - one
        Section(header: Text("General Settings")) {
          Toggle(isOn: $enableNotification) {
            Text("Enable Notifications")
          }
          Toggle(isOn: $backgroundRefresh) {
            Text("Refresh Background")
          }
        }
        
        // MARK: - two
        Section(header: Text("Application Info")) {
          if (enableNotification) {
            HStack {
              Text("Product").foregroundColor(.gray)
              Spacer()
              Text("Avocado Recipes")
            }
            HStack {
              Text("Compatibility").foregroundColor(.gray)
              Spacer()
              Text("iPhone and iPad")
            }
            HStack {
              Text("Developer").foregroundColor(.gray)
              Spacer()
              Text("Maya")
            }
            HStack {
              Text("Designer").foregroundColor(.gray)
              Spacer()
              Text("Robert Petras")
            }
            HStack {
              Text("Website").foregroundColor(.gray)
              Spacer()
              Text("swiftuimasterclass.com")
            }
            HStack {
              Text("Version").foregroundColor(.gray)
              Spacer()
              Text("1.0.0")
            }
          } else {
            HStack {
              Text("Message")
                .foregroundColor(.gray)
              Spacer()
              Text("Happy Coding!")
            }
          }
        }
        
        
      }
    }
    .frame(maxWidth: 640)
    
  } //: body
} //: struct

// MARK: - preview
struct SettingsView_Previews: PreviewProvider {
  static var previews: some View {
    SettingsView()
  }
}
