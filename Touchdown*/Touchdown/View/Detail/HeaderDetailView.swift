//
//  HeaderDetailView.swift
//  Touchdown
//
//  Created by Maja Wirkijowska on 7/1/22.
//

import SwiftUI

struct HeaderDetailView: View {
  // MARK: - props
  @EnvironmentObject var shop: Shop
  
  // MARK: - body
  var body: some View {
  
    VStack(alignment: .leading, spacing: 6, content: {
      Text("Protective Gear")
      
      Text(shop.selectedProduct?.name ?? sampleProduct.name)
        .font(.largeTitle)
        .fontWeight(.black)
      
    }) //: vstack
    .foregroundColor(.white)
    
  } //: body
}

// MARK: - preview
struct HeaderDetailView_Previews: PreviewProvider {
  static var previews: some View {
    HeaderDetailView()
      .environmentObject(Shop())
      .previewLayout(.sizeThatFits)
      .padding()
      .background(.gray)
  }
}
