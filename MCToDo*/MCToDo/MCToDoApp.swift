//
//  MCToDoApp.swift
//  MCToDo
//
//  Created by Maja Wirkijowska on 7/15/22.
//

import SwiftUI

@main
struct MCToDoApp: App {
  let persistenceController = PersistenceController.shared
  
  var body: some Scene {
    WindowGroup {
      ContentView()
        .environmentObject(IconNames())
        .environment(\.managedObjectContext, persistenceController.container.viewContext)
    }
  }
}

