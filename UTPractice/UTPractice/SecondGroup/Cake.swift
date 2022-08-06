//
//  Cake.swift
//  UTPractice
//
//  Created by Maja Wirkijowska on 7/26/22.
//

import SwiftUI

struct Cake {
  func bake(ingredients: [String]) -> Int {
    for ingredient in ingredients {
      print("Adding \(ingredient).")
    }
    
    let cost = 1 + (ingredients.count * 3)
    print("The cake is ready; cost is $\(cost).")
    return cost
  }
}
