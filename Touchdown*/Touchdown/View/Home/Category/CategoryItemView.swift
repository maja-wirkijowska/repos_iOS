//
//  CategoryItemView.swift
//  Touchdown
//
//  Created by Maja Wirkijowska on 7/1/22.
//

import SwiftUI

struct CategoryItemView: View {
  // MARK: - props
  let category: Category
  
  // MARK: - body
  var body: some View {
  
    Button(action: {}, label: {
      
      HStack(alignment: .center, spacing: 6) {
        
        Image(category.image)
          .renderingMode(.template)
          .resizable()
          .scaledToFit()
          .frame(width: 30, height: 30, alignment: .center)
          .foregroundColor(.gray)
        
        Text(category.name.uppercased())
          .fontWeight(.light)
          .foregroundColor(.gray)
          .multilineTextAlignment(.leading)
        
        Spacer()
      } //: hstack
      .frame(width: 175, height: 45, alignment: .leading) // additional
      .padding()
      .background(Color.white.cornerRadius(12))
      .background(
        RoundedRectangle(cornerRadius: 12)
          .stroke(Color.gray, lineWidth: 1)
      )
      
    }) //: button
    
  } //: body
}

// MARK: - preview
struct CategoryItemView_Previews: PreviewProvider {
  static var previews: some View {
    CategoryItemView(category: categories[0])
      .previewLayout(.sizeThatFits)
      .padding()
      .background(colorBackground)
  }
}
