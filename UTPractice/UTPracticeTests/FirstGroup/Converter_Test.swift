//
//  Converter_Test.swift
//  UTPracticeTests
//
//  Created by Maja Wirkijowska on 7/26/22.
//

import XCTest
@testable import UTPractice

class Converter_Test: XCTestCase {
  
  var sut: Converter!
  
  override func setUp() {
    sut = Converter()
  }
  
  override func tearDown() {
    sut = nil
  }

  func test_32FahrenheitIsZeroCelcius() {
    // GIVEN
    let input = 32.0
    // WHEN
    let output = sut.convertToCelcius(fahrenheit: input)
    // THEN
    XCTAssertEqual(output, 0, accuracy: 0.000001)
  }
  
  func test_212FahrenheitIs100Celcius() {
    // GIVEN
    let input = 212.0
    // WHEN
    let output = sut.convertToCelcius(fahrenheit: input)
    // THEN
    XCTAssertEqual(output, 100, accuracy: 0.000001)
  }
  
  func test_100FahrenheitIs37Celcius() {
    // GIVEN
    let input = 100.0
    // WHEN
    let output = sut.convertToCelcius(fahrenheit: input)
    // THEN
    XCTAssertEqual(output, 37.777777, accuracy: 0.000001)
  }
  
}
