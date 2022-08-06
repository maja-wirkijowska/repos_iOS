//
//  Store.swift
//  UTPractice
//
//  Created by Maja Wirkijowska on 7/27/22.
//

import SwiftUI

class StoreUser { }

class Store {
  var user: StoreUser?
  
  func assert(_ condition: @autoclosure () -> Bool, _ message: @autoclosure () -> String = String(), file: StaticString = #file, line: UInt = #line) {
    Swift.assert(condition(), message(), file: file, line: line)
  }
  
  func buy(product: String) -> Bool {
    assert(user != nil, "We can't buy anything without a user")
    print("The user bought \(product).")
    return true
  }
}

class MockStore: Store {
  var wasAssertionSuccessful = false
  
  override func assert(_ condition: @autoclosure () -> Bool, _ message: @autoclosure () -> String = String(), file: StaticString = #file, line: UInt = #line) {
    wasAssertionSuccessful = condition()
  }
}
