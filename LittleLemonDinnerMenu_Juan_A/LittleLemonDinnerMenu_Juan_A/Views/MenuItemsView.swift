//
//  MenuItemsView.swift
//  LittleLemonDinnerMenu_Juan_A
//
//  Created by Juan Alvarez on 8/7/23.
//

//MARK: Task 1 Build user interfaces in SwiftUI using the wireframe references


import SwiftUI

struct MenuItemsView: View {
    // ViewModel holder as a state object
    @StateObject private var viewModel = MenuViewViewModel()
    
    var body: some View {
        // Display example items in MenuItemView based on filter selection (drinks, food, desserts).
        
        NavigationStack {
            ScrollView {
                // Display food items if the flag is set
                if viewModel.isShowFood {
                    MenuItemView(menuItems: viewModel.foods, menuCategory: .food).environmentObject(viewModel)
                }
                
                // Display drink items if the flag is set
                if viewModel.isShowDrinks {
                    MenuItemView(menuItems: viewModel.drinks, menuCategory: .drink).environmentObject(viewModel)
                }
                
                // Display dessert items if the flag is set
                if viewModel.isShowDesserts {
                    MenuItemView(menuItems: viewModel.desserts, menuCategory: .dessert).environmentObject(viewModel)
                }
            }
            // Sort sample data alphabetically as the view appears
            .onAppear() {
                viewModel.updateMenuItems()
            }
            //MARK: Task 2 Add a navigation bar button
            .navigationTitle("Menu")
            .toolbar {
                Button(action: {
                    viewModel.isOpenedOptionView.toggle()
                }, label: {
                    Image(systemName: "slider.horizontal.3")
                })
            }
        }
        .environmentObject(viewModel)  // Real-time data updates for all child views

            // Launches OptionView for data filtering options.
            .sheet(isPresented: $viewModel.isOpenedOptionView) {
                NavigationStack {
                    MenuItemsOptionView().environmentObject(viewModel)
                        .toolbar {
                            // On button press, data is sorted based on user preference.
                            Button("Done") {
                                viewModel.updateMenuItems()
                                viewModel.isOpenedOptionView.toggle()
                        }
                    }
                }
            }
        }
    }


struct MenuItemsView_Previews: PreviewProvider {
    static var previews: some View {
        MenuItemsView()
    }
}
