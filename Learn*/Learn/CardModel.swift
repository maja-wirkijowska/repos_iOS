//
//  CardModel.swift
//  Learn
//
//  Created by Maja Wirkijowska on 7/7/22.
//

import SwiftUI

struct Card: Identifiable {
  var id = UUID()
  var title: String
  var headline: String
  var imageName: String
  var callToAction: String
  var message: String
  var gradientColors: [Color]
}
