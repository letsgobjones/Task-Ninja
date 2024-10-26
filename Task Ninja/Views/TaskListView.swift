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
          ForEach(pendingTaskItems) { taskItem in
            TaskCellView(taskItem: taskItem, onChanged: taskStore.updateTaskItem)
            
          }
        }
        Section("Completed") {
          ForEach(completedTaskItems) { taskItem in
            TaskCellView(taskItem: taskItem, onChanged: taskStore.updateTaskItem)
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
