//
//  Shop.swift
//  Touchdown
//
//  Created by Maja Wirkijowska on 7/1/22.
//

import Foundation

// ObservableObject protocol always instances of this class to be used inside any View
//    View will reload whenever important changes occur

// @Published
//    wany changes to these props should trigger the View to reload

class Shop: ObservableObject {
  @Published var showingProduct: Bool = false
  @Published var selectedProduct: Product? // default value is nil
}
