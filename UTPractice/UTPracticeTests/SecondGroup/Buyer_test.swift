//
//  Buyer_test.swift
//  UTPracticeTests
//
//  Created by Maja Wirkijowska on 7/27/22.
//

import XCTest
@testable import UTPractice

class HouseMock: LocalHouseProtocol {
  var numberOfViewings: Int = 0
  func conductViewing() {
    numberOfViewings += 1
  }
}

class Buyer_test: XCTestCase {

  func test_ViewingHouseAddsOneToViewings() {
    // GIVEN
    let house = LocalHouse()
    // WHEN
    house.conductViewing()
    // THEN
    XCTAssertEqual(house.numberOfViewings, 1)
  }
  
  func test_ViewHouseAddsOneToViewingCount_better() {
    // GIVEN
    let house = LocalHouse()
    let startNumberViewings = house.numberOfViewings
    // WHEN
    house.conductViewing()
    // THEN
    XCTAssertEqual(house.numberOfViewings, startNumberViewings + 1)
  }
  
  func test_buyerViewingHouseAddsOneToViewingCount() {
    // GIVEN
    let buyer = Buyer()
    let mockHouse = HouseMock()
    // WHEN
    buyer.view(mockHouse)
    // THEN
    XCTAssertEqual(mockHouse.numberOfViewings, 1)
  }

}
