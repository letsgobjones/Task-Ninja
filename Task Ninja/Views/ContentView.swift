//
//  ContentView.swift
//  Task Ninja
//
//  Created by Brandon Jones on 10/22/24.
//

import SwiftUI

struct ContentView: View {
  
  @Environment(\.managedObjectContext) private var context
  @FetchRequest(sortDescriptors: []) private var taskItems: FetchedResults<TaskItem>
  
  @State private var title: String = ""

  private var isFormValid: Bool {
    !title.isEmptyOrWhitespace
  }
  
  private var pendingTaskItems: [TaskItem] {
    taskItems.filter { !$0.isCompleted }
  }
  
  private var completedTaskItems: [TaskItem] {
    taskItems.filter { $0.isCompleted }
  }
  
  
  
  
    var body: some View {
        VStack {
            TextField("Enter a title", text: $title)
            .textFieldStyle(.roundedBorder)
            .onSubmit {
              if isFormValid {
                saveTaskItem()
              }
            }
          
          List {
            Section("Pending") {
              ForEach(pendingTaskItems) { taskItem in
                Text(taskItem.title ?? "")
                
              }
            }
            Section("Completed") {
              ForEach(completedTaskItems) { taskItem in
                Text(taskItem.title ?? "")
              }
            }
            
          }.listStyle(.plain)
          Spacer()
        }
        .padding()
        .navigationTitle("Task Ninja")
    }
}

#Preview {
  NavigationStack {
    ContentView()
      .environment(\.managedObjectContext, CoreDataProvider.preview.viewContext)
  }
}


extension ContentView {
  private func saveTaskItem() {
    let taskItem = TaskItem(context: context)
    taskItem.title = title
    do {
      try context.save()
    } catch {
      print(error)
    }
    title = ""

  }
}

