//
//  NavBarDetailView.swift
//  Touchdown
//
//  Created by Maja Wirkijowska on 7/1/22.
//

import SwiftUI

struct NavBarDetailView: View {
  // MARK: - props
  @EnvironmentObject var shop: Shop
  
  // MARK: - body
  var body: some View {
  
    HStack {
      
      Button(action: {
        withAnimation(.easeIn) {
          feedback.impactOccurred()
          shop.selectedProduct = nil
          shop.showingProduct = false
        }
      }, label: {
        
        Image(systemName: "chevron.left")
          .font(.title)
          .foregroundColor(.white)
      
      }) //: back button
      
      Spacer()
      
      Button(action: {}, label: {
        Image(systemName: "cart")
          .font(.title)
          .foregroundColor(.white)
      }) //: cart button
      
    } //: hstack
    
  } //: body
}

// MARK: - preview
struct NavBarDetailView_Previews: PreviewProvider {
  static var previews: some View {
    NavBarDetailView()
      .environmentObject(Shop())
      .previewLayout(.sizeThatFits)
      .padding()
      .background(.gray)
  }
}
