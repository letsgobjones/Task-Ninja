//
//  Task_NinjaApp.swift
//  Task Ninja
//
//  Created by Brandon Jones on 10/22/24.
//

import SwiftUI

@main
struct Task_NinjaApp: App {
  
  let provider = CoreDataProvider()
    var body: some Scene {
        WindowGroup {
          NavigationStack {
            ContentView()
              .environment(\.managedObjectContext, provider.viewContext)
          }
        }
    }
}
