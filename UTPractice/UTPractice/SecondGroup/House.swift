//
//  House.swift
//  UTPractice
//
//  Created by Maja Wirkijowska on 7/26/22.
//

import SwiftUI

struct House {
  var bedrooms: Int
  var bathrooms: Int
  var cost: Int
  
  init(bedrooms: Int, bathrooms: Int) {
    self.bedrooms = bedrooms
    self.bathrooms = bathrooms
    self.cost = bedrooms * bathrooms * 50_000
  }
  
  func checkSuitability(desireBedrooms: Int, desiredBathrooms: Int) -> Bool {
    if (bedrooms >= desireBedrooms && bathrooms >= desiredBathrooms) {
      return true
    } else {
      return false
    }
  }
}
