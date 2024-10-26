//
//  ContentView.swift
//  Task Ninja
//
//  Created by Brandon Jones on 10/22/24.
//

import SwiftUI

struct ContentView: View {
  
  @Environment(\.managedObjectContext) private var context
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
                saveTaskItem()
              }
            }
        }
        .padding()
    }
}

#Preview {
    ContentView()
    .environment(\.managedObjectContext, CoreDataProvider.preview.viewContext)
}


extension ContentView {
  private func saveTaskItem() {
    
    
  }
}
