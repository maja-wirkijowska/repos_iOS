//
//  RatingView.swift
//  Avocados
//
//  Created by Maja Wirkijowska on 7/7/22.
//

import SwiftUI

struct RatingView: View {
  // MARK: - props
  var recipe: Recipe
  
  // MARK: - body
  var body: some View {
    
    HStack(alignment: .center, spacing: 5) {
      ForEach(1 ... (recipe.rating), id: \.self) { _ in
        Image(systemName: "star.fill")
          .font(.body)
        .foregroundColor(.yellow)
      }
    }
    
  }
}

// MARK: - preview
struct RatingView_Previews: PreviewProvider {
  static var previews: some View {
    RatingView(recipe: recipeData[0])
      .previewLayout(.fixed(width: 320, height: 60))
  }
}
