//
//  ToDoDemoApp.swift
//  ToDoDemo
//
//  Created by Maja Wirkijowska on 7/11/22.
//

import SwiftUI

@main
struct ToDoDemoApp: App {
  
  let persistenceController = PersistenceController.shared
  
  var body: some Scene {
    WindowGroup {
      HomeView()
        .environment(\.managedObjectContext, persistenceController.container.viewContext)
    }
  }
}
