//
//  Division.swift
//  UTPractice
//
//  Created by Maja Wirkijowska on 7/26/22.
//

import SwiftUI

struct Division {
  
  func divisionRemainder(of number: Int, dividedBy: Int) -> (quotient: Int, remainder: Int) {
    let quotient = number / dividedBy
    let remainder = number % dividedBy
    return (quotient, remainder)
  }
}

