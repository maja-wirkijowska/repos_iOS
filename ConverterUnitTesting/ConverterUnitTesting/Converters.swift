//
//  Converters.swift
//  ConverterUnitTesting
//
//  Created by Maja Wirkijowska on 7/25/22.
//

import SwiftUI

class Converters {
  func convertEuroToUSD(euro: String) -> String {
    let usdRate = 1.08
    let euroValue = Double(euro) ?? 0
    
    if euroValue <= 0 {
      return "Please enter a positive number"
    }
    
    if euroValue >= 1_000_000 {
      return "Value to big to convert"
    }
    
    return"$\(String(format: "%.2f", euroValue * usdRate))"
    
  }
}
