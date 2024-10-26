//
//  TaskCellView.swift
//  Task Ninja
//
//  Created by Brandon Jones on 10/26/24.
//

import SwiftUI

struct TaskCellView: View {

  let taskItem: TaskItem
  let onChanged: (TaskItem) -> Void
  
  
    var body: some View {
      HStack {
        Image(systemName: taskItem.isCompleted ? "checkmark.square" : "square")
          .onTapGesture {
            taskItem.isCompleted.toggle()
            onChanged(taskItem)
          }
        if taskItem.isCompleted {
          Text(taskItem.title ?? "")
        } else {
          TextField("", text: Binding(get: {
            taskItem.title ?? ""
          }, set: { newValue in
            taskItem.title = newValue
          })).onSubmit {
            onChanged(taskItem)
          }
        }
        
      }
    }
}

#Preview {
  let taskItem = TaskItem(context: CoreDataProvider.preview.viewContext)
  taskItem.title = "Test Task"
  taskItem.isCompleted = false
  
  return TaskCellView( taskItem: taskItem, onChanged: { _ in }).padding()
  
}
