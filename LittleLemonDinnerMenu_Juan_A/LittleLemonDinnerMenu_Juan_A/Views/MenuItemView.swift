//
//  MenuItemView.swift
//  LittleLemonDinnerMenu_Juan_A
//
//  Created by Juan Alvarez on 8/7/23.
//

//MARK: Task 1 Build user interfaces in SwiftUI using the wireframe references

import SwiftUI

struct MenuItemView: View {
    
    // MARK: - Properties
    
    @EnvironmentObject var viewModel: MenuViewViewModel
    
    var menuItems: [MenuItem]
    var menuCategory: MenuCategory
    
    // Three-column grid layout for displaying menu items
    private var threeColumnGrid = [GridItem(.flexible()), GridItem(.flexible()), GridItem(.flexible())]
    
    // MARK: - Initializer
    
    init(menuItems: [MenuItem], menuCategory: MenuCategory) {
        self.menuItems = menuItems
        self.menuCategory = menuCategory
    }
    
    // MARK: - Body
    
    var body: some View {
        VStack {
            // Display category title (e.g., food, drink, dessert)
            HStack {
                Text(menuCategory.rawValue)
                    .font(.title)
                    .fontWeight(.semibold)
                Spacer()
            }
            
            // Displays menu items in a 3-column grid layout
            LazyVGrid(columns: threeColumnGrid) {
                ForEach(menuItems, id: \.self) { menuItem in
                    NavigationLink(destination: MenuItemDetailsView(menuItem: menuItem)) {
                        VStack {
                            Rectangle()  // Placeholder for dish image
                            Text(menuItem.title)
                        }
                        .frame(height: 120)
                        .foregroundColor(.black)
                    }
                }
            }
        }
        .padding()  // Default padding for visual focus on menu items
    }
}


struct MenuItemView_Previews: PreviewProvider {
    static var previews: some View {
        let viewModel = MenuViewViewModel()
        MenuItemView(menuItems: viewModel.foods, menuCategory: .food)
    }
}
