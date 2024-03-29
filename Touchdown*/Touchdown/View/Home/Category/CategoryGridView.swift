//
//  CategoryGridView.swift
//  Touchdown
//
//  Created by Maja Wirkijowska on 7/1/22.
//

import SwiftUI

struct CategoryGridView: View {
  // MARK: - props
  
  // MARK: - body
  var body: some View {
  
    ScrollView( .horizontal, showsIndicators: false, content: {
      
      LazyHGrid(rows: gridLayout, alignment: .center, spacing: columnSpacing, pinnedViews: [], content: {
        
        Section(header: SectionView(rotateClockwise: false), footer: SectionView(rotateClockwise: true)) {
          
          ForEach(categories) { category in
            CategoryItemView(category: category)
          } //: loop
          
        } //: section
        
      }) //: hgrid
      .frame(height: 160)
      .padding(.horizontal, 15)
      .padding(.vertical,10)
      
    }) //: scroll
    
  } //: body
}

// MARK: - preview
struct CategoryGridView_Previews: PreviewProvider {
  static var previews: some View {
    CategoryGridView()
      .previewLayout(.sizeThatFits)
      .padding()
      .background(colorBackground)
  }
}
