//
//  TouchdownApp.swift
//  Touchdown
//
//  Created by Maja Wirkijowska on 7/1/22.
//

import SwiftUI

@main
struct TouchdownApp: App {
  var body: some Scene {
    WindowGroup {
      ContentView()
        .environmentObject(Shop()) // allows us to create Views that rely on shared data
    }
  }
}
