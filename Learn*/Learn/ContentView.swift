//
//  ContentView.swift
//  Learn
//
//  Created by Maja Wirkijowska on 7/6/22.
//

import SwiftUI

struct ContentView: View {
  // MARK: - props
  var cards: [Card] = cardData
  
  // MARK: - body
  var body: some View {
    
    ScrollView(.horizontal, showsIndicators: false) {
      HStack(alignment: .center, spacing: 20) {
        
        ForEach(cards) { item in
          
          CardView(card: item)
          
        } //: for each
        
      } //: hstack
      .padding(20)
    } //: scroll view
    
  } //: body
} //: struct

// MARK: - preview
struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView(cards: cardData)
      .previewDevice("iPhone 13")
  }
}
