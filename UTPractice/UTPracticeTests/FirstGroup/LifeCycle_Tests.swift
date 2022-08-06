//
//  LifeCycle_Tests.swift
//  UTPracticeTests
//
//  Created by Maja Wirkijowska on 7/26/22.
//

import XCTest
@testable import UTPractice

class LifeCycle_Tests: XCTestCase {
  
  override class func setUp() {
   print("In CLASS setUp()")
  }
  
  override class func tearDown() {
    print("In CLASS tearDown()")
  }
  
  override func setUp() {
    print("In setUp()")
  }
  
  override func tearDown() {
    print("In tearDown()")
  }
  
  func test_example() {
    print("Starting test_example()")
    
    addTeardownBlock {
      print("In first tearDown block")
    }
    
    print("In middle of test_example()")
    
    addTeardownBlock {
      print("In second tearDown block")
    }
    
    print("Finishing test_example()")
  }
  

}
