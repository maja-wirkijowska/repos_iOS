//
//  ContentView.swift
//  Touchdown
//
//  Created by Maja Wirkijowska on 7/1/22.
//

import SwiftUI

struct ContentView: View {
  // MARK: - props
  @EnvironmentObject var shop: Shop
  
  // MARK: - body
  var body: some View {
  
    ZStack {
      
      if (shop.showingProduct == false && shop.selectedProduct == nil) {
        VStack(spacing: 0) {
          
          NavigationBarView()
            .padding(.horizontal, 15)
            .padding(.bottom)
            .padding(.top, UIApplication.shared.connectedScenes.flatMap { ($0 as? UIWindowScene)?.windows ?? [] }.first { $0.isKeyWindow }?.safeAreaInsets.top)
            .background(.white)
            .shadow(color: Color.black.opacity(0.05), radius: 5, x: 0, y: 5)
          
          ScrollView(.vertical, showsIndicators: false, content: {
            
            VStack(spacing: 0) {
              
              FeaturedTabView()
                .frame(height: UIScreen.main.bounds.width / 1.475)
                .padding(.vertical, 10)
              
              CategoryGridView()
              
              TitleView(title: "Helmets")
              
              LazyVGrid(columns: gridLayout, spacing: 15, content: {
                
                ForEach(products) { product in
                  ProductItemView(product: product)
                    .onTapGesture {
                      feedback.impactOccurred()
                      withAnimation(.easeOut) {
                        shop.selectedProduct = product
                        shop.showingProduct = true
                      } //: withAnimation()
                    } //: onTapGesture()
                } //: loop
                
              }) //: vgrid
              .padding(15)
              
              TitleView(title: "Brands")
              BrandGridView()
              
              FooterView()
                .padding(.horizontal)
              
            } //: vstack
            
          }) //: scroll content
        } //: vstack
        .background(colorBackground.ignoresSafeArea(.all, edges: .all))
      } else {
        ProductDetailView()
      } //: conditional
      
    } //: zstack
    .ignoresSafeArea(.all, edges: .top)
    
  } //: body
}

// MARK: - preview
struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView()
      .previewDevice("iPhone 13")
      .environmentObject(Shop())
    ContentView()
      .previewDevice("iPhone 8")
      .environmentObject(Shop())
  }
}
