//
//  DevoteApp.swift
//  Devote
//
//  Created by Maja Wirkijowska on 7/1/22.
//

import SwiftUI

@main
struct DevoteApp: App {
  let persistenceController = PersistenceController.shared
  @AppStorage("isDarkMode") var isDarkMode: Bool = false
  
  var body: some Scene {
    WindowGroup {
      ContentView()
        // managed object context is desinged to store active core data managed object context
        // the managed object context is injected for the core data container in the whole app, including all child views
        .environment(\.managedObjectContext, persistenceController.container.viewContext)
        .preferredColorScheme(isDarkMode ? .dark : .light)
    }
  }
}
