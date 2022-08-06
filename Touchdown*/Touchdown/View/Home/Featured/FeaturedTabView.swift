//
//  FeaturedTabView.swift
//  Touchdown
//
//  Created by Maja Wirkijowska on 7/1/22.
//

import SwiftUI

struct FeaturedTabView: View {
  // MARK: - props
  
  // MARK: - body
  var body: some View {
    
    TabView {
      
      ForEach(players) { player in
        
        FeaturedItemView(player: player)
          .padding(.top, 10)
          .padding(.horizontal, 15)
        
      } //: loop
      
    } //: tab
    .tabViewStyle(PageTabViewStyle(indexDisplayMode: .always))
    
  } //: body
}

// MARK: - preview
struct FeaturedTabView_Previews: PreviewProvider {
  static var previews: some View {
    FeaturedTabView()
      .previewDevice("iPhone 13")
      .background(Color.gray)
  }
}
