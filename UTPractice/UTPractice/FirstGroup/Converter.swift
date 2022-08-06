//
//  Converter.swift
//  UTPractice
//
//  Created by Maja Wirkijowska on 7/26/22.
//

import SwiftUI

struct Converter {
  
  func convertToCelcius(fahrenheit: Double) -> Double {
    let fahrenheit = Measurement(value: fahrenheit, unit: UnitTemperature.fahrenheit)
    
    let celcius = fahrenheit.converted(to: .celsius)
    
    return celcius.value
  }
  
}
