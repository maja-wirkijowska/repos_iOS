//
//  Store_test.swift
//  UTPracticeTests
//
//  Created by Maja Wirkijowska on 7/27/22.
//

import XCTest
@testable import UTPractice

class Store_test: XCTestCase {

  func test_StoreBuy_noUser() {
    // GIVEN
    let store = MockStore()
    // WHEN
    _ = store.buy(product: "Chocolate")
    // THEN
    XCTAssertFalse(store.wasAssertionSuccessful)
  }

}
