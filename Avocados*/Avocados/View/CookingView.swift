//
//  CookingView.swift
//  Avocados
//
//  Created by Maja Wirkijowska on 7/7/22.
//

import SwiftUI

struct CookingView: View {
  // MARK: - props
  var recipe: Recipe
  
  // MARK: - body
  var body: some View {
    HStack(alignment: .center, spacing: 12) {
      
      HStack(alignment: .center, spacing: 2) {
        Image(systemName: "person.2")
        Text("Servings: \(recipe.serves)")
      }
      
      HStack(alignment: .center, spacing: 2) {
        Image(systemName: "clock")
        Text("Prep Time: \(recipe.preparation)")
      }
      
      HStack(alignment: .center, spacing: 2) {
        Image(systemName: "flame")
        Text("Cook Time: \(recipe.cooking)")
      }
      
    }
    .font(.footnote)
    .foregroundColor(.gray)
  }
}

struct CookingView_Previews: PreviewProvider {
  static var previews: some View {
    CookingView(recipe: recipeData[0])
      .previewLayout(.sizeThatFits)
      
  }
}
