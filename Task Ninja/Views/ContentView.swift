//
//  ContentView.swift
//  Task Ninja
//
//  Created by Brandon Jones on 10/22/24.
//

import SwiftUI

struct ContentView: View {
//  @Environment(\.managedObjectContext) private var context
  
  @EnvironmentObject var taskStore: TaskStore
  @State private var title: String = ""

  private var isFormValid: Bool {
    !title.isEmptyOrWhitespace
  }
  
    var body: some View {
        VStack {
            TextField("Enter a title", text: $title)
            .textFieldStyle(.roundedBorder)
            .onSubmit {
              if isFormValid {
                taskStore.saveTaskItem(title: title)
                title = ""
              }
            }
          
          TaskListView()
          
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
      .environmentObject(TaskStore(context: CoreDataProvider.preview.viewContext))
  }
}


//extension ContentView {
//  private func saveTaskItem() {
//    let taskItem = TaskItem(context: context)
//    taskItem.title = title
//    do {
//      try context.save()
//    } catch {
//      print(error)
//    }
//    title = ""
//
//  }
//}

