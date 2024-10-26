# Task Ninja 🥷🏾

Task Ninja is a simple and intuitive task management app built with SwiftUI and Core Data. It allows you to effortlessly manage your daily tasks, mark them as complete, and keep track of your progress.

## Features

- **Clean and User-Friendly Interface:**  A simple and easy-to-navigate design for a smooth user experience.
- **Persistent Data Storage:**  Tasks are stored persistently using Core Data, ensuring your data is safe even if the app is closed.
- **Mark as Complete:**  Easily mark tasks as completed with a tap.
- **Edit Tasks:** Edit task titles directly within the list.
- **Delete Tasks:**  Swipe to delete tasks you no longer need.
- **Separate Pending/Completed:**  Tasks are organized into "Pending" and "Completed" sections for better clarity.
- **Efficient Data Handling:**  Utilizes `@EnvironmentObject` for sharing task data and `@FetchRequest` for fetching tasks from Core Data.
- **Custom Core Data Management:**  Includes a `CoreDataProvider` class for streamlined Core Data stack management.
- **Preview Data:**  Pre-populated preview data for easy development and testing.

## Technologies Used 🖥️

- SwiftUI
- Core Data
- Swift

## Project Structure 📝

- **`CoreDataProvider.swift`:**  Manages the Core Data stack and provides a `viewContext`.
- **`TaskStore.swift`:**  Observable object for handling task data operations (save, update, delete).
- **`ContentView.swift`:**  Main view with a text field for adding new tasks and a `TaskListView`.
- **`TaskListView.swift`:**  Displays the list of tasks, separated into "Pending" and "Completed" sections.
- **`TaskCellView.swift`:**  View for a single task item, allowing for marking as complete and editing the title.
- **`TaskItem+CoreDataClass.swift`, `TaskItem+CoreDataProperties.swift`:**  Generated Core Data files for the `TaskItem` entity.
- **`String+Extension.swift`:**  Adds an `isEmptyOrWhitespace` property to the `String` type.
