//
//  Buyer.swift
//  UTPractice
//
//  Created by Maja Wirkijowska on 7/27/22.
//

import SwiftUI

class Buyer {
  func view(_ house: LocalHouseProtocol) {
    house.conductViewing()
  }
}

class LocalHouse: LocalHouseProtocol {
  var numberOfViewings = 0
  
  func conductViewing() {
    numberOfViewings += 1
  }
}

protocol LocalHouseProtocol {
  var numberOfViewings: Int { get set }
  func conductViewing()
}
