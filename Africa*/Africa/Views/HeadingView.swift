//
//  HeadingView.swift
//  Africa
//
//  Created by Maja Wirkijowska on 6/29/22.
//

import SwiftUI

struct HeadingView: View {
  // MARK: - props
  var headingImage: String
  var headingText: String
  
  // MARK: - body
  var body: some View {
    HStack {
      Image(systemName: headingImage)
        .foregroundColor(.accentColor)
        .imageScale(.large)
      
      Text(headingText)
        .font(.title3)
        .fontWeight(.bold)
    } //: hstack
    .padding(.vertical)
    
  }
}

// MARK: - preview
struct HeadingView_Previews: PreviewProvider {
  static var previews: some View {
    HeadingView(headingImage: "photo.on.rectangle.angled", headingText: "heading text")
      .previewLayout(.sizeThatFits)
      .padding()
  }
}
