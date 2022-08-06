//
//  ProductItemView.swift
//  Touchdown
//
//  Created by Maja Wirkijowska on 7/1/22.
//

import SwiftUI

struct ProductItemView: View {
  // MARK: - props
  let product: Product
  
  // MARK: - body
  var body: some View {
  
    VStack(alignment: .leading, spacing: 6, content: {
      
      // photo
      ZStack {
        Image(product.image)
          .resizable()
          .scaledToFit()
          .padding(10)
        
      } //: zstack
      .background(Color(red: product.red, green: product.green, blue: product.blue))
      .cornerRadius(12)
      
      // name
      Text(product.name)
        .font(.title3)
        .fontWeight(.bold)
      
      // price
      Text(product.formattedPrice)
        .fontWeight(.semibold)
        .foregroundColor(.gray)
      
    }) //: vstack
    
  } //: body
}

// MARK: - preview
struct ProductItemView_Previews: PreviewProvider {
  static var previews: some View {
    ProductItemView(product: products[0])
      .previewLayout(.fixed(width: 200, height: 300))
      .padding()
      .background(colorBackground)
  }
}
