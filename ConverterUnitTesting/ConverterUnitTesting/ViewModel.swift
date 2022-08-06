//
//  ViewModel.swift
//  ConverterUnitTesting
//
//  Created by Maja Wirkijowska on 7/25/22.
//

import SwiftUI

final class ViewModel: ObservableObject {
  @Published var text = ""
  @Published var convertedText = "$0"
  private let converter = Converters()
  
  func convertMoney() {
    self.convertedText = converter.convertEuroToUSD(euro: text)
    self.hideKeyboard()
  }
  
  func hideKeyboard() {
    UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
  }
}
