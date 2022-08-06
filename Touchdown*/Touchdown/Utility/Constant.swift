//
//  Constant.swift
//  Touchdown
//
//  Created by Maja Wirkijowska on 7/1/22.
//

import SwiftUI

// MARK: - json data
let players: [Player] = Bundle.main.decode("player.json")
let categories: [Category] = Bundle.main.decode("category.json")
let products: [Product] = Bundle.main.decode("product.json")
let brands: [Brand] = Bundle.main.decode("brand.json")

// MARK: - data
let sampleProduct: Product = products[0]

// MARK: - colors
let colorBackground: Color = Color("ColorBackground")
let colorGray: Color = Color(UIColor.systemGray4)

// MARK: - layout
let columnSpacing: CGFloat = 10
let rowSpacing: CGFloat = 10
var gridLayout: [GridItem] {
  return Array(repeating: GridItem(.flexible(), spacing: rowSpacing), count: 2)
}

// MARK: - ux
let feedback = UIImpactFeedbackGenerator(style: .medium)

// MARK: - api

// MARK: - image

// MARK: - font

// MARK: - string
let weOffer: String = "We offer the most cutting edge, comfortable, lightweight and durable football helmets on the market at affordable prices."
let copyright: String = "Copyright © Robert Petras\nMaja Wirkijowska\nAll Rights Reserved"

// MARK: - misc
