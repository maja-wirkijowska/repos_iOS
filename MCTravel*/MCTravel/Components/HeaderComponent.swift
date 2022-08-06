//
//  HeaderComponent.swift
//  MCTravel
//
//  Created by Maja Wirkijowska on 7/18/22.
//

import SwiftUI

struct HeaderComponent: View {
  // MARK: - body
  var body: some View {
    
    VStack(alignment: .center, spacing: 20) {
      Capsule()
        .frame(width: 120, height: 6)
        .foregroundColor(.secondary)
        .opacity(0.2)
      
      Image(logo)
        .resizable()
        .scaledToFit()
        .frame(height: 28)
    } //: vstack - main
    
  } //: body -
} //: struct -

// MARK: - preview
struct HeaderComponent_Previews: PreviewProvider {
  static var previews: some View {
    HeaderComponent()
      .previewLayout(.fixed(width: 375, height: 128))
  }
}
