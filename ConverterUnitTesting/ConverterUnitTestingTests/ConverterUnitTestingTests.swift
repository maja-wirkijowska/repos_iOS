//
//  ConverterUnitTestingTests.swift
//  ConverterUnitTestingTests
//
//  Created by Maja Wirkijowska on 7/25/22.
//

import XCTest
@testable import ConverterUnitTesting

class ConverterUnitTestingTests: XCTestCase {
  
  private var converter: Converters!
  
  override func setUpWithError() throws {
    converter = Converters()
  }
  
  override func tearDownWithError() throws {
    converter = nil
  }
  
  func test_convert10_returns1080() {
    let actual = converter.convertEuroToUSD(euro: "10")
    let expected = "$10.80"
    
    XCTAssertEqual(actual, expected)
  }
  
  func test_convertNegative_returnsErrorMessage() {
    let actual = converter.convertEuroToUSD(euro: "-10")
    let expected = "Please enter a positive number"
    
    XCTAssertEqual(actual, expected)
  }
  
  func test_convertTooBigNumber_returnsErrorMessage() {
    let actual = converter.convertEuroToUSD(euro: "1000001")
    let exected = "Value to big to convert"
    
    XCTAssertEqual(actual, exected)
  }
  
  func test_inputEmptyString_returnsErrorMessage() {
    let actual = converter.convertEuroToUSD(euro: "")
    let expected = "Please enter a positive number"
    
    XCTAssertEqual(actual, expected)
  }
  
  func test_inputDecimal_returnsDecimal() {
    let actual = converter.convertEuroToUSD(euro: "10.50")
    let expected = "$11.34"
    
    XCTAssertEqual(actual, expected)
  }

}
