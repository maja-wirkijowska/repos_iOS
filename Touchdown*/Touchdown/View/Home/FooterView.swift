//
//  FooterView.swift
//  Touchdown
//
//  Created by Maja Wirkijowska on 7/1/22.
//

import SwiftUI

struct FooterView: View {
  // MARK: - props
  
  // MARK: - body
  var body: some View {
    
    VStack(alignment: .center, spacing: 10) {
      Text(weOffer)
        .foregroundColor(.gray)
        .multilineTextAlignment(.center)
        .layoutPriority(2)
      Image("logo-lineal")
        .renderingMode(.template)
        .foregroundColor(.gray)
        .layoutPriority(0)
      Text(copyright)
        .font(.footnote)
        .fontWeight(.bold)
        .foregroundColor(.gray)
        .multilineTextAlignment(.center)
        .layoutPriority(1)
      
    } //: vstack
    .padding()
    
  } //: body
}

// MARK: - preview
struct FooterView_Previews: PreviewProvider {
  static var previews: some View {
    FooterView()
      .previewLayout(.sizeThatFits)
      .background(colorBackground)
  }
}
