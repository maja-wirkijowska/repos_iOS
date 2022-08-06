//
//  App.swift
//  UTPractice
//
//  Created by Maja Wirkijowska on 7/26/22.
//

import SwiftUI

protocol UserProtocal {
  var funds: Decimal { get set }
  var age: Int { get set }
  var apps: [AppProtocol] { get set }
  mutating func buy(_ app: AppProtocol) -> Bool
}

struct AppUser: UserProtocal {
  var age: Int
  var funds: Decimal
  var apps: [AppProtocol]
  
  
  mutating func buy(_ app: AppProtocol) -> Bool {
    let possible = app.canBePurchased(by: self)
    
    if possible {
      apps.append(app)
      funds -= app.price
      return true
    } else {
      return false
    }
  }
}

protocol AppProtocol {
  var price: Decimal { get set }
  var minAge: Int { get set }
  var isReleased: Bool { get set }
  
  func canBePurchased(by user: UserProtocal) -> Bool
  static func printTerms()
}

extension AppProtocol {
  static func printTerms() {
    print("Here are way too many pages of terms and conditions that may or may not ask for your soul but you won't read them anyway.")
  }
}

struct MyApp: AppProtocol {
  var price: Decimal
  var minAge: Int
  var isReleased: Bool
  
  func canBePurchased(by user: UserProtocal) -> Bool {
    guard isReleased else {
      return false
    }
    
    guard user.funds >= price else {
      return false
    }
    
    if user.age >= minAge {
      return true
    } else {
      return false
    }
  }
}
