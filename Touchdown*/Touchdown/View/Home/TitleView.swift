//
//  TitleView.swift
//  Touchdown
//
//  Created by Maja Wirkijowska on 7/1/22.
//

import SwiftUI

struct TitleView: View {
  // MARK: - props
  var title: String
  
  // MARK: - body
  var body: some View {
    
    HStack {
      
      Text(title)
        .font(.largeTitle)
        .fontWeight(.heavy)
      
      Spacer()
    
    } //: hstack
    .padding(.horizontal)
    .padding(.top, 15)
    .padding(.bottom, 10)
    
  } //: body
}

// MARK: - preview
struct TitleView_Previews: PreviewProvider {
  static var previews: some View {
    TitleView(title: "Helmet")
      .previewLayout(.sizeThatFits)
      .background(colorBackground)
  }
}
