//
//  RecipeCardView.swift
//  Avocados
//
//  Created by Maja Wirkijowska on 7/7/22.
//

import SwiftUI

struct RecipeCardView: View {
  // MARK: - props
  var recipe: Recipe
  var hapticImapct = UIImpactFeedbackGenerator(style: .heavy)
  @State private var showModel: Bool = false
  
  // MARK: - body
  var body: some View {
    
    VStack(alignment: .leading, spacing: 0) {
      
      // MARK: - card image
      Image(recipe.image)
        .resizable()
        .scaledToFit()
        .overlay(
          HStack {
            Spacer()
            VStack {
              Image(systemName: "bookmark")
                .font(Font.title.weight(.light))
                .foregroundColor(.white)
                .imageScale(.small)
                .shadow(color: blackLight, radius: 2, x: 0, y: 0)
                .padding(.trailing, 20)
                .padding(.top, 22)
              Spacer()
            }
          }
        ) //: image overlay
      
      VStack(alignment: .leading, spacing: 12) {
        // title
        Text(recipe.title)
          .font(.system(.title, design: .serif))
          .fontWeight(.bold)
          .foregroundColor(greenMedium)
          .lineLimit(1)
        
        // headline
        Text(recipe.headline)
          .font(.system(.body,design: .serif))
          .foregroundColor(.gray)
          .italic()
        
        // rating
        RatingView(recipe: recipe)
        
        // cooking
        CookingView(recipe: recipe)
          
        
      }
      .padding()
      .padding(.bottom, 12)
      
    }
    .background(.white)
    .cornerRadius(12)
    .shadow(color: blackLight, radius: 8, x: 0, y: 0)
    .onTapGesture {
      self.hapticImapct.impactOccurred()
      self.showModel = true
    }
    .sheet(isPresented: self.$showModel) {
      RecipeDetailView(recipe: self.recipe)
    }
  }
}

// MARK: - preview
struct RecipeCardView_Previews: PreviewProvider {
  static var previews: some View {
    RecipeCardView(recipe: recipeData[0])
      .previewLayout(.sizeThatFits)
  }
}
