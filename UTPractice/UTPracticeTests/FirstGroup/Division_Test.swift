//
//  Division_Test.swift
//  UTPracticeTests
//
//  Created by Maja Wirkijowska on 7/26/22.
//

import XCTest
@testable import UTPractice

class Division_Test: XCTestCase {
  var sut: Division!
  
  override func setUp() {
    sut = Division()
  }
  
  override func tearDown() {
    sut = nil
  }
  

  func verifyDivision(_ result: (quotient: Int, remainder: Int), expectedQuotient: Int, expectedRemainder: Int, file: StaticString = #file, line: UInt = #line) {
    XCTAssertEqual(result.quotient, expectedQuotient, file: file, line: line)
    XCTAssertEqual(result.remainder, expectedRemainder, file: file, line: line)
  }
  
  func test_divisionRemainer() {
    // GIVEN
    let divident = 10
    let divisor = 3
    // WHEN
    let result = sut.divisionRemainder(of: divident, dividedBy: divisor)
    // THEN
    XCTAssertEqual(result.quotient, 3)
    XCTAssertEqual(result.remainder, 1)
  }

}
