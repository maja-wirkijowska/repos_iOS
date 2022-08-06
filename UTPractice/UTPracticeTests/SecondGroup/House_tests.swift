//
//  House_tests.swift
//  UTPracticeTests
//
//  Created by Maja Wirkijowska on 7/26/22.
//

import XCTest
@testable import UTPractice

class House_tests: XCTestCase {

  func test_4Bed2Bath_Fits3Bed2BathReq() {
    // GIVEN
    let house = House(bedrooms: 4, bathrooms: 2)
    let desiredBeds = 3
    let desiredBaths = 2
    // WHEN
    let suitability = house.checkSuitability(desireBedrooms: desiredBeds, desiredBathrooms: desiredBaths)
    // THEN
    XCTAssertTrue(suitability)
  }

}
