//
//  BrandGridView.swift
//  Touchdown
//
//  Created by Maja Wirkijowska on 7/1/22.
//

import SwiftUI

struct BrandGridView: View {
  // MARK: - props
  
  // MARK: - body
  var body: some View {
  
    ScrollView(.horizontal, showsIndicators: false, content: {
      
      LazyHGrid(rows: gridLayout, spacing: columnSpacing, content: {
        
        ForEach(brands) { brand in
          BrandItemView(brand: brand)
        } //: loop
        
      }) //: hgrid
      .frame(height: 200)
      .padding(15)
      
    }) //: scroll
    
  } //: body
}

// MARK: - preview
struct BrandGridView_Previews: PreviewProvider {
  static var previews: some View {
    BrandGridView()
      .previewLayout(.sizeThatFits)
      .background(colorBackground)
  }
}
