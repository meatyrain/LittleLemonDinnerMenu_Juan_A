# Little Lemon Dinner Menu App🍋

## 📖 Project Overview

The Little Lemon Dinner Menu is a modern, interactive iOS application built entirely with **Swift** and **SwiftUI**. Designed for the fictional "Little Lemon" restaurant, this app provides a dynamic and user-friendly digital menu. It allows users to browse food, drinks, and desserts, and offers powerful sorting and filtering capabilities to enhance the dining experience.

This project was developed as part of a course on mobile application development, focusing on implementing a clean **MVVM (Model-View-ViewModel)** architecture and leveraging the full power of Swift's modern features.

## ✨ Core Features

- **Modern UI & Reactivity**: The entire user interface is built programmatically with **SwiftUI**, creating a reactive and responsive experience that automatically updates when data changes.
    
- **MVVM Architecture**: All business logic, data, and state are managed in a `MenuViewViewModel`, cleanly separating the presentation layer from the application's logic.
    
- **Dynamic Sorting**: Users can sort menu items based on multiple criteria:
    
    - ⭐️ **Most Popular** (by order count)
        
    - 💰 **Price** (low to high)
        
    - 🔤 **Alphabetical** (A-Z)
        
- **Advanced Filtering**: The menu can be filtered to show specific categories (Food, Drinks, Desserts) or ingredients, allowing users to customize their view.
    
- **Rich Data Modeling**: The application features a robust data model using `structs` for menu items and type-safe `enums` for categories, ingredients, and sorting options.
    
- **Protocol-Oriented Design**: Utilizes a `MenuItemProtocol` to enforce a consistent structure for all menu items, a key principle of modern Swift development.
    
- **State Management**: Effectively uses SwiftUI's `@Published` property wrapper to manage the application's state and ensure the UI is always in sync with the data.
    

## 🏗️ How to Compile and Run

This project was built using Xcode. To compile and run the application:

1. **Prerequisites**: Make sure you have **Xcode** installed on a macOS machine.
    
2. **Clone the Repository**: Clone this project to your local machine using Git.
    
3. **Open in Xcode**: Open the `.xcodeproj` or `.xcworkspace` file in Xcode.
    
4. **Select a Simulator**: Choose an iOS Simulator (e.g., iPhone 14 Pro).
    
5. **Run**: Click the "Run" button (▶) in Xcode to build and run the application on the selected simulator.

    
