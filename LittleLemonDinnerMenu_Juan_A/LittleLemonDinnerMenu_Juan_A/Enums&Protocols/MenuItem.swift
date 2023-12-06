//
//  MenuItem.swift
//  LittleLemonDinnerMenu_Juan_A
//
//  Created by Juan Alvarez on 8/7/23.
//

import Foundation
//MARK: Task 7 a menu item protocol that enforces the following conformances on the delegates
protocol MenuItemProtocol {
    var id: UUID { get }
    var price: Double { get }
    var title: String { get }
    var menuCategory: MenuCategory { get }
    var ordersCount: Int { get set }
    var ingredient: [Ingredient] { get set }
}

struct MenuItem: Identifiable, Hashable, MenuItemProtocol {
    var id = UUID()
    var price: Double
    var title: String
    var menuCategory: MenuCategory
    var ordersCount: Int
    var ingredient: [Ingredient]
    
}
