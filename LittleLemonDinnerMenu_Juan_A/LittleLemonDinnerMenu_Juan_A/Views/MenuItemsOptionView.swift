//
//  MenuItemsOptionView.swift
//  LittleLemonDinnerMenu_Juan_A
//
//  Created by Juan Alvarez on 8/7/23.
//

//MARK: Task 1 Build user interfaces in SwiftUI using the wireframe references


import SwiftUI

struct MenuItemsOptionView: View {
    
    @EnvironmentObject var viewModel: MenuViewViewModel
    
    var body: some View {
        NavigationStack {
            List {
                // Used toggle to enable multiple item selection, allowing combinations like drinks and food. I wanted to implement a pick like the one in the sort by but the style was too dissimilar to the wireframe briefs.
                Section("Selected categories") {
                    Toggle(MenuCategory.food.rawValue, isOn: $viewModel.isShowFood)
                    Toggle(MenuCategory.drink.rawValue, isOn: $viewModel.isShowDrinks)
                    Toggle(MenuCategory.dessert.rawValue, isOn: $viewModel.isShowDesserts)
                }
                // Opted for picker to allow single item selection from multiple choices.
                Picker("Sort by", selection: $viewModel.sortBy) {
                    ForEach(SortBy.allCases, id: \.self) { category in
                        Text(category.rawValue).tag(category)
                    }
                }
            }
            .pickerStyle(.inline)
            .listStyle(.grouped)
        }
        .navigationTitle("Filter")
    }
}


struct MenuItemsOptionView_Previews: PreviewProvider {
    static var previews: some View {
        MenuItemsOptionView().environmentObject(MenuViewViewModel())
    }
}
