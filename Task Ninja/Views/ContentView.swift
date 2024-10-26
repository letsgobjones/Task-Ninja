//
//  ContentView.swift
//  Task Ninja
//
//  Created by Brandon Jones on 10/22/24.
//

import SwiftUI

struct ContentView: View {  
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

