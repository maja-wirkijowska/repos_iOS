//
//  TopDetailView.swift
//  Touchdown
//
//  Created by Maja Wirkijowska on 7/1/22.
//

import SwiftUI

struct TopDetailView: View {
  // MARK: - props
  @State private var isAnimating: Bool = false
  @EnvironmentObject var shop: Shop
  
  // MARK: - body
  var body: some View {
    
    HStack(alignment: .center, spacing: 6, content: {
      // price
      VStack(alignment: .leading, spacing: 6, content: {
        Text("Price")
          .fontWeight(.semibold)
        
        Text(shop.selectedProduct?.formattedPrice ?? sampleProduct.formattedPrice)
          .font(.largeTitle)
          .fontWeight(.black)
          .scaleEffect(1.35, anchor: .leading)
      }) //: vstack
      .offset(y: isAnimating ? -50 : -75)
      
      Spacer()
      
      // photo
      Image(shop.selectedProduct?.image ?? sampleProduct.image)
        .resizable()
        .scaledToFit()
        .offset(y: isAnimating ? 0 : -35)
      
    }) //: hstack
    .onAppear(perform: {
      withAnimation(.easeOut(duration: 0.75)) {
        isAnimating.toggle()
      }
    }) //: onAppear()
  
  } //: body
}

// MARK: - preview
struct TopDetailView_Previews: PreviewProvider {
  static var previews: some View {
    TopDetailView()
      .environmentObject(Shop())
      .previewLayout(.sizeThatFits)
      .padding()
  }
}
