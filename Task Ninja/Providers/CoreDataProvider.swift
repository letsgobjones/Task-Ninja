//
//  CoreDataProvider.swift
//  Task Ninja
//
//  Created by Brandon Jones on 10/22/24.
//

import Foundation
import CoreData

class CoreDataProvider {
  let persistentContainer: NSPersistentContainer
  
  var viewContext: NSManagedObjectContext {
    persistentContainer.viewContext
  }
  
  static var preview: CoreDataProvider =  {
    let provider = CoreDataProvider(inMemory: true)
    let viewContext = provider.viewContext
    
    for index in 1..<10 {
      let taskItem = TaskItem(context: viewContext)
      taskItem.title = "Task Item \(index)"
    }
    do {
     try viewContext.save()
    } catch {
      print("Error saving view context: \(error)")
    }
    return provider
    
  }()
  
  
  init(inMemory: Bool = false) {
    persistentContainer = NSPersistentContainer(name: "TaskModel")
    
    if inMemory {
      persistentContainer.persistentStoreDescriptions.first!.url = URL(fileURLWithPath: "/dev/null")
    }
    
    persistentContainer.loadPersistentStores { _, error in
      if let error {
        fatalError("Core Data failed to initialize: \(error)")
        
      }
    }
    
  }
}
