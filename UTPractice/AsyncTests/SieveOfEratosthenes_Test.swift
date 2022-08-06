//
//  SieveOfEratosthenes_Test.swift
//  AsyncTests
//
//  Created by Maja Wirkijowska on 7/26/22.
//

import XCTest
@testable import UTPractice

class SieveOfEratosthenes_Test: XCTestCase {

  func test_calculate_primesUpTo100ShouldBe25() {
    // GIVEN
    let maxCount = 100
    let expectation = XCTestExpectation(description: "Calc primes up to \(maxCount)")
    // WHEN
    PrimeCalculator.calculate(upTo: maxCount) {
      // THEN
      XCTAssertEqual($0.count, 25)
      expectation.fulfill()
    }
    wait(for: [expectation], timeout: 10)
  }
  
//  func test_calculate2_primesUpTo100ShouldBe25() {
//    // GIVEN
//    let maxCount = 100
//    // WHEN
//    let progress = PrimeCalculator.calculate2(upTo: maxCount) {
//      XCTAssertEqual($0.count, 25)
//    }
//    // THEN
//    let predicate = NSPredicate(
//    format: "%@.completedUnitCount == %@", argumentArray: [progress, maxCount]
//    )
//    let expectation = XCTNSPredicateExpectation(predicate: predicate, object: progress)
//    wait(for: [expectation], timeout: 10)
//  }
  
  func test_calculateStreaming_primesUpTo100ShouldBe25() {
    // GIVEN
    let maxCount = 100
    let expectation = XCTestExpectation(description: "Calc primes up to \(maxCount)")
    expectation.expectedFulfillmentCount = 25
    // WHEN
    PrimeCalculator.calculateStreaming(upTo: maxCount) { number in
      expectation.fulfill()
    }
    wait(for: [expectation], timeout: 3)
  }
  
  func test_primePerf() {
    measure {
      _ = TwoPrimeCalc.calculate(upTo: 1_000_000)
    }
  }

}
