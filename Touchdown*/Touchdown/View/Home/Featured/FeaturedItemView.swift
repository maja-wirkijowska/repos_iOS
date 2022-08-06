//
//  FeaturedItemView.swift
//  Touchdown
//
//  Created by Maja Wirkijowska on 7/1/22.
//

import SwiftUI

struct FeaturedItemView: View {
  // MARK: - props
  let player: Player
  
  // MARK: - body
  var body: some View {
        
    Image(player.image)
      .resizable()
      .scaledToFit()
      .cornerRadius(12)
    
  } //: body
}

// MARK: - preview
struct FeaturedItemView_Previews: PreviewProvider {
  static var previews: some View {
    FeaturedItemView(player: players[0])
      .previewLayout(.sizeThatFits)
      .padding()
      .background(colorBackground)
  }
}
