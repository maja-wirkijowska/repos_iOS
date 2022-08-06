//
//  AddToCartDetailView.swift
//  Touchdown
//
//  Created by Maja Wirkijowska on 7/1/22.
//

import SwiftUI

struct AddToCartDetailView: View {
  // MARK: - props
  @EnvironmentObject var shop: Shop
  
  // MARK: - body
  var body: some View {
  
    Button(action: {
      feedback.impactOccurred()
    }, label: {
      Spacer()
      Text("Add to cart".uppercased())
        .font(.system(.title2, design: .rounded))
        .fontWeight(.bold)
        .foregroundColor(.white)
      Spacer()
    }) //: button
    .padding(15)
    .background(
      Color(
        red: shop.selectedProduct?.red ?? sampleProduct.red,
        green: shop.selectedProduct?.green ?? sampleProduct.green,
        blue: shop.selectedProduct?.blue ?? sampleProduct.blue))
    .clipShape(Capsule())
    
  } //: body
}

// MARK: - preview
struct AddToCartDetailView_Previews: PreviewProvider {
  static var previews: some View {
    AddToCartDetailView()
      .environmentObject(Shop())
      .previewLayout(.sizeThatFits)
      .padding()
  }
}
