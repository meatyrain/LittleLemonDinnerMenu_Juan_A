//
//  MenuViewViewModel.swift
//  LittleLemonDinnerMenu_Juan_A
//
//  Created by Juan Alvarez on 8/7/23.
//

import Foundation

//MARK: Task 6 class to store the business logic of the main menu view
class MenuViewViewModel: ObservableObject {
    
    
    // Food menu items
    @Published var selectedCategory: MenuCategory = .food

    @Published var foods: [MenuItem] = [
        MenuItem(price: 18.0, title: "Food 4", menuCategory: .food, ordersCount: 10, ingredient: [.tomatoSauce, .carrot, .pasta]),
        MenuItem(price: 10.0, title: "Food 5", menuCategory: .food, ordersCount: 10, ingredient: [.tomatoSauce]),
        MenuItem(price: 90.0, title: "Food 6", menuCategory: .food, ordersCount: 10, ingredient: [.tomatoSauce]),
        MenuItem(price: 20.0, title: "Food 7", menuCategory: .food, ordersCount: 10, ingredient: [.tomatoSauce, .spinach, .carrot]),
        MenuItem(price: 10.0, title: "Food 1", menuCategory: .food, ordersCount: 10, ingredient: [.tomatoSauce]),
        MenuItem(price: 15.0, title: "Food 2", menuCategory: .food, ordersCount: 15, ingredient: [.tomatoSauce, .pasta]),
        MenuItem(price: 25.0, title: "Food 3", menuCategory: .food, ordersCount: 20, ingredient: [.spinach, .broccoli]),
        MenuItem(price: 25.50, title: "Food 8", menuCategory: .food, ordersCount: 10, ingredient: [.tomatoSauce, .broccoli]),
        MenuItem(price: 10.0, title: "Food 9", menuCategory: .food, ordersCount: 10, ingredient: [.tomatoSauce]),
        MenuItem(price: 35.0, title: "Food 10", menuCategory: .food, ordersCount: 10, ingredient: [.spinach]),
        MenuItem(price: 45.0, title: "Food 11", menuCategory: .food, ordersCount: 10, ingredient: [.pasta]),
        MenuItem(price: 75.0, title: "Food 12", menuCategory: .food, ordersCount: 10, ingredient: [.carrot, .spinach])
    ]
    // Drink menu items
    @Published var drinks: [MenuItem] = [
        MenuItem(price: 18.0, title: "Drink 4", menuCategory: .drink, ordersCount: 0, ingredient: []),
        MenuItem(price: 10.0, title: "Drink 5", menuCategory: .drink, ordersCount: 10, ingredient: []),
        MenuItem(price: 10.0, title: "Drink 1", menuCategory: .drink, ordersCount: 0, ingredient: []),
        MenuItem(price: 15.0, title: "Drink 2", menuCategory: .drink, ordersCount: 15, ingredient: []),
        MenuItem(price: 10.0, title: "Drink 3", menuCategory: .drink, ordersCount: 20, ingredient: []),
        MenuItem(price: 10.0, title: "Drink 6", menuCategory: .drink, ordersCount: 10, ingredient: []),
        MenuItem(price: 20.0, title: "Drink 7", menuCategory: .drink, ordersCount: 10, ingredient: []),
        MenuItem(price: 25.0, title: "Drink 8", menuCategory: .drink, ordersCount: 10, ingredient: [])
    ]
    // Dessert menu items
    @Published var desserts: [MenuItem] = [
        MenuItem(price: 15.0, title: "Dessert 2", menuCategory: .dessert, ordersCount: 15, ingredient: []),
        MenuItem(price: 10.0, title: "Dessert 3", menuCategory: .dessert, ordersCount: 20, ingredient: []),
        MenuItem(price: 10.0, title: "Dessert 1", menuCategory: .dessert, ordersCount: 0, ingredient: []),
        MenuItem(price: 18.0, title: "Dessert 4", menuCategory: .dessert, ordersCount: 0, ingredient: [])
    ]
    
    @Published var isOpenedOptionView = false
    @Published var isShowFood = true
    @Published var isShowDrinks = true
    @Published var isShowDesserts = true
    
    @Published var sortBy = SortBy.fromAtoZ
    
    
    
    func updateMenuItems() {
        switch sortBy {
        // Sort by popularity based on order count
        case .mostPopular:
            foods.sort(by: { $0.ordersCount > $1.ordersCount })
            drinks.sort(by: { $0.ordersCount > $1.ordersCount })
            desserts.sort(by: { $0.ordersCount > $1.ordersCount })
        
        // Sort items by price in ascending order
        case .fromLowPrice:
            foods.sort(by: { $0.price < $1.price })
            drinks.sort(by: { $0.price < $1.price })
            desserts.sort(by: { $0.price < $1.price })
        
        // Sort items alphabetically and numerically by title
        case .fromAtoZ:
            foods.sort(by: { sortByTitle(lhs: $0, rhs: $1) })
            drinks.sort(by: { sortByTitle(lhs: $0, rhs: $1) })
            desserts.sort(by: { sortByTitle(lhs: $0, rhs: $1) })
        }
    }

    /*
        Sorts the data based on the following criteria:
        1. Splits the title of each MenuItem into substrings.
        2. Attempts to extract a number from the last substring. Defaults to 0 if not a number.
        3. Compares these numbers for sorting.
        4. If numbers are the same, uses the full title for comparison.
        Returns true if lhs should precede rhs in the sorted array.
    */
    func sortByTitle(lhs: MenuItem, rhs: MenuItem) -> Bool {
        let lhsTitleParts = lhs.title.split(separator: " ")
        let rhsTitleParts = rhs.title.split(separator: " ")
        let lhsNumber = Int(lhsTitleParts.last!) ?? 0
        let rhsNumber = Int(rhsTitleParts.last!) ?? 0
        if lhsNumber != rhsNumber {
            return lhsNumber < rhsNumber
        } else {
            return lhs.title < rhs.title
        }
    }


    
    
}

