//
//  TaskStore.swift
//  Task Ninja
//
//  Created by Brandon Jones on 10/26/24.
//

import SwiftUI
import CoreData

class TaskStore: ObservableObject {

  private var viewContext: NSManagedObjectContext
  
  init(context: NSManagedObjectContext) {
      self.viewContext = context
  }
  
  func saveTaskItem(title: String) {
    let taskItem = TaskItem(context: viewContext)
    taskItem.title = title
    do {
      try viewContext.save()
    } catch {
      print(error)
    }
  }
  
  
  func updateTaskItem(_ taskItem: TaskItem) {
    do {
      try viewContext.save()
    }
    catch {
      print(error)
    }
    
  }
  
  func deleteTaskItem(_ taskItem: TaskItem) {
    viewContext.delete(taskItem)
    do {
      try viewContext.save()
    }
    catch {
      print(error)
    }
  }
  
}
