//
//  TaskListView.swift
//  Task Ninja
//
//  Created by Brandon Jones on 10/26/24.
//

import SwiftUI

struct TaskListView: View {
  @FetchRequest(sortDescriptors: []) private var taskItems: FetchedResults<TaskItem>
  @EnvironmentObject var taskStore: TaskStore

  
  private var pendingTaskItems: [TaskItem] {
    taskItems.filter { !$0.isCompleted }
  }
  
  private var completedTaskItems: [TaskItem] {
    taskItems.filter { $0.isCompleted }
  }
  
  
    var body: some View {
      List {
        Section("Pending") {
          if pendingTaskItems.isEmpty {
            ContentUnavailableView("No items found.", systemImage: "doc")
          } else {
            ForEach(pendingTaskItems) { taskItem in
              TaskCellView(taskItem: taskItem, onChanged: taskStore.updateTaskItem)
              
            }
          }
        }
        
        Section("Completed") {
          if completedTaskItems.isEmpty {
            ContentUnavailableView("No items found.", systemImage: "doc")
          } else {
            ForEach(completedTaskItems) { taskItem in
              TaskCellView(taskItem: taskItem, onChanged: taskStore.updateTaskItem)
            }
          }
        }
        
      }.listStyle(.plain)
      
      
    }
}

#Preview {
  NavigationStack {
    TaskListView()
      .environment(\.managedObjectContext, CoreDataProvider.preview.viewContext)
      .environmentObject(TaskStore(context: CoreDataProvider.preview.viewContext))


    
    
    
  }
}
