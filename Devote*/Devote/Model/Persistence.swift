//
//  Persistence.swift
//  Devote
//
//  Created by Maja Wirkijowska on 7/1/22.
//

import CoreData

struct PersistenceController {
  // MARK: - persistent controller - singleton
  static let shared = PersistenceController()
  
  // MARK: - persistant container
  let container: NSPersistentContainer
  
  // MARK: - initialization (load the persistance store)
  init(inMemory: Bool = false) {
    container = NSPersistentContainer(name: "Devote")
    if inMemory {
      container.persistentStoreDescriptions.first!.url = URL(fileURLWithPath: "/dev/null")
    }
    container.loadPersistentStores(completionHandler: { (storeDescription, error) in
      if let error = error as NSError? {
    
        fatalError("Unresolved error \(error), \(error.userInfo)")
      }
    })
    container.viewContext.automaticallyMergesChangesFromParent = true
  }
  
  // MARK: - preview
  static var preview: PersistenceController = {
    let result = PersistenceController(inMemory: true) // switch to in memory store
    let viewContext = result.container.viewContext
    for i in 0..<5 {  // set up dummy data
      let newItem = Item(context: viewContext)
      newItem.timestamp = Date()
      newItem.task = "Sample task #\(i)"
      newItem.completion = false
      newItem.id = UUID()
    }
    do {  // saves data to in memory store 
      try viewContext.save()
    } catch {
      
      let nsError = error as NSError
      fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
    }
    return result
  }()
}
