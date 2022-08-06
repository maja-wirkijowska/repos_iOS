//
//  Cake_tests.swift
//  UTPracticeTests
//
//  Created by Maja Wirkijowska on 7/26/22.
//

import XCTest
@testable import UTPractice

class Cake_tests: XCTestCase {

  func test_3IngredientsCostIs9() {
    // GIVEN
    let cake = Cake()
    let ingredients = ["Chocolate", "cherries", "flour"]
    // WHEN
    let cost = cake.bake(ingredients: ingredients)
    // THEN
    XCTAssertEqual(cost, 10)
  }

}
