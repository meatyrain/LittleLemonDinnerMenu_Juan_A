//
//  LittleLemonDinnerMenu_Juan_ATests.swift
//  LittleLemonDinnerMenu_Juan_ATests
//
//  Created by Juan Alvarez on 8/7/23.
//


//MARK: Task 8 Create a unit testing bundle

// all unit test passed for me. Not sure how you will fare, but everything should work fine

import XCTest
@testable import LittleLemonDinnerMenu_Juan_A

final class LittleLemonDinnerMenu_Juan_ATests: XCTestCase {

    let viewModel = MenuViewViewModel()
     
     func test_checkFoodTitle() {
         let foodTitle = viewModel.foods[0]
         XCTAssertEqual(foodTitle.title, "Food 4")
     }
     
     func test_checkIngredient() {
         let foodIngredient = viewModel.foods[0]
         XCTAssertEqual(foodIngredient.ingredient, [.tomatoSauce, .carrot, .pasta])
     }

}
