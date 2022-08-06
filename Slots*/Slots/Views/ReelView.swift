//
//  ReelView.swift
//  Slots
//
//  Created by Maja Wirkijowska on 7/14/22.
//

import SwiftUI

struct ReelView: View {
  var body: some View {
    
    Image(reel)
      .resizable()
      .modifier(ImageModifier())
    
  }
}

struct ReelView_Previews: PreviewProvider {
  static var previews: some View {
    ReelView()
      .previewLayout(.fixed(width: 220, height: 220))
  }
}
