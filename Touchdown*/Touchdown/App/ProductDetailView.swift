//
//  ProductDetailView.swift
//  Touchdown
//
//  Created by Maja Wirkijowska on 7/1/22.
//

import SwiftUI

struct ProductDetailView: View {
  // MARK: - props
  @EnvironmentObject var shop: Shop
  
  // MARK: - body
  var body: some View {
  
    VStack(alignment: .leading, spacing: 5, content: {
      
      // nav bar
      NavBarDetailView()
        .padding(.horizontal)
        .padding(.top, UIApplication.shared.connectedScenes.flatMap { ($0 as? UIWindowScene)?.windows ?? [] }.first { $0.isKeyWindow }?.safeAreaInsets.top)
      
      // header
      HeaderDetailView()
        .padding(.horizontal)
      
      // detail top
      TopDetailView()
        .padding(.horizontal)
        .zIndex(1)
      
      // detail bottom
      VStack(alignment: .center, spacing: 0, content: {
        
        // ratings and sizes
        RatingSizesDetailView()
          .padding(.top, -25)
          .padding(.bottom, 10)
        
        // description
        ScrollView(.vertical, showsIndicators: false, content: {
          Text(shop.selectedProduct?.description ?? sampleProduct.description)
            .font(.system(.body, design: .rounded))
            .foregroundColor(.gray)
            .multilineTextAlignment(.leading)
        }) //: scroll
        
        // quantity and favorites
        QuantityFavDetailView()
          .padding(.vertical, 10)
        
        // add to cart
        AddToCartDetailView()
          .padding(.bottom, 20)
        
      }) //: vstack
      .padding(.horizontal)
      .background(
        Color.white
          .clipShape(CustomShape())
          .padding(.top, -105)
      )
      
      Spacer()
      
    }) //: vstack
    .zIndex(0)
    .ignoresSafeArea(.all, edges: .all)
    .background(
      Color(
        red: shop.selectedProduct?.red ?? sampleProduct.red,
        green: shop.selectedProduct?.green ?? sampleProduct.green,
        blue: shop.selectedProduct?.blue ?? sampleProduct.blue
      ).ignoresSafeArea(.all, edges: .all))
        
  } //: body
}

// MARK: - preview
struct ProductDetailView_Previews: PreviewProvider {
  static var previews: some View {
    ProductDetailView()
      .environmentObject(Shop())
      .previewLayout(.fixed(width: 375, height: 812))
  }
}
