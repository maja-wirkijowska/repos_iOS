//
//  MyApp_tests.swift
//  UTPracticeTests
//
//  Created by Maja Wirkijowska on 7/26/22.
//

import XCTest
@testable import UTPractice

struct UnreleasedAppStub: AppProtocol {
  var price: Decimal = 0
  var minAge: Int = 0
  var isReleased: Bool = false
  
  func canBePurchased(by user: UserProtocal) -> Bool {
    return false
  }
}

class MyApp_tests: XCTestCase {

  func test_canBePurchased_cannotBePurchased() {
    // GIVEN
    var user = AppUser(age: 21, funds: 100, apps: [])
    let app = UnreleasedAppStub()
    // WHEN
    let wasBaught = user.buy(app)
    // THEN
    XCTAssertFalse(wasBaught)
  }

  /*
   type(of: app).printTerms()
   */
  
}
