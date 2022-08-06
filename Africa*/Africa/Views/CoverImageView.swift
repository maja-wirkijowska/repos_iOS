//
//  CoverImageView.swift
//  Africa
//
//  Created by Maja Wirkijowska on 6/29/22.
//

import SwiftUI

struct CoverImageView: View {
  // MARK: - props
  let coverImages: [CoverImage] = Bundle.main.decode("covers.json")
  
  // MARK: - body
  var body: some View {
    TabView {
      ForEach(coverImages) { item in
        Image(item.name)
          .resizable()
          .scaledToFill()
      } //: for each loop
    } //: tab view
    .tabViewStyle(PageTabViewStyle())
  }
}

// MARK: - preview
struct CoverImageView_Previews: PreviewProvider {
  static var previews: some View {
    CoverImageView()
      .previewLayout(.fixed(width: 400, height: 300))
  }
}
