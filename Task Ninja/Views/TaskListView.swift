//
//  TaskListView.swift
//  Task Ninja
//
//  Created by Brandon Jones on 10/26/24.
//

import SwiftUI

struct TaskListView: View {
  @FetchRequest(sortDescriptors: []) private var taskItems: FetchedResults<TaskItem>

  
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
            TaskCellView(taskItem: taskItem) {_ in }
            
          }
        }
        Section("Completed") {
          ForEach(completedTaskItems) { taskItem in
            TaskCellView(taskItem: taskItem) {_ in }
          }
        }
        
      }.listStyle(.plain)
      
      
    }
}

#Preview {
  NavigationStack {
    TaskListView()
      .environment(\.managedObjectContext, CoreDataProvider.preview.viewContext)

    
    
    
  }
}
