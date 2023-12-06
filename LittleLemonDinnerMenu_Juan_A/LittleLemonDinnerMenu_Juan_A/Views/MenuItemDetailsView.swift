//
//  MenuItemDetailsView.swift
//  LittleLemonDinnerMenu_Juan_A
//
//  Created by Juan Alvarez on 8/7/23.
//

//MARK: Task 1 Build user interfaces in SwiftUI using the wireframe references


import SwiftUI

struct MenuItemDetailsView: View {
    
    var menuItem: MenuItem
    
    var body: some View {
        NavigationStack {
            // Placeholder for dish image.
            Image("Little Lemon logo")
                .resizable(resizingMode: .stretch)
                .aspectRatio(contentMode: .fit)
            // conditional to display details if item count is greater than 0.
            if menuItem.price > 0 {
                VStack {
                    Text("Price:")
                        .fontWeight(.bold)
                    // Formats the double to "0.00".
                    Text(String(format: "%.2f", menuItem.price))
                }
                .padding(1)
            }
            if menuItem.ordersCount > 0 {
                VStack {
                    Text("Ordered:")
                        .fontWeight(.bold)
                    Text("\(menuItem.ordersCount)")
                }
                .padding(1)
            }
            if menuItem.ingredient.count > 0 {
                VStack {
                    Text("Ingredients:")
                        .fontWeight(.bold)
                    ForEach(menuItem.ingredient, id: \.self) {
                        Text($0.rawValue)
                    }
                }
                .padding(1)
            }
            
        }
        .navigationTitle(menuItem.title)
        .padding([.leading, .trailing], 60)
    }
}

struct MenuItemDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        let menuItem = MenuItem(price: 10, title: "Food 1", menuCategory: .food, ordersCount: 15, ingredient: [.tomatoSauce])
        MenuItemDetailsView(menuItem: menuItem)
    }
}
