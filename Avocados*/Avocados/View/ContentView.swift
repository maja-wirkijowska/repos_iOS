//
//  ContentView.swift
//  Avocados
//
//  Created by Maja Wirkijowska on 7/7/22.
//

import SwiftUI

struct ContentView: View {
  // MARK: - props
  var headers: [Header] = headerData
  var facts: [Fact] = factData
  var recipes: [Recipe] = recipeData
  
  // MARK: - body
  var body: some View {
    
    ScrollView(.vertical, showsIndicators: false) {
      
      VStack(alignment: .center, spacing: 20) {
        
        // MARK: - header
        ScrollView(.horizontal, showsIndicators: false) {
          HStack(alignment: .top, spacing: 0) {
            ForEach(headers) { item in
              HeaderView(header: item)
            }
          }
        }
        
        // MARK: - dishes
        Text("Avocado Dishes")
          .fontWeight(.bold)
          .modifier(TitleModifier())
          
        DishesView()
          .frame(maxWidth: 640)
        
        // MARK: - facts
        Text("Avocado Facts")
          .fontWeight(.bold)
          .modifier(TitleModifier())
        
        ScrollView(.horizontal, showsIndicators: false) {
          HStack(alignment: .top, spacing: 60) {
            ForEach(facts) { item in
              FactsView(fact: item)
            }
          }
          .padding(.vertical)
          .padding(.leading, 60)
          .padding(.trailing, 20)
        }
        
        // MARK: - recipe card
        Text("Avocado Recipes")
          .fontWeight(.bold)
          .modifier(TitleModifier())
        
        VStack(alignment: .center, spacing: 20) {
          ForEach(recipes) { item in
            RecipeCardView(recipe: item)
          }
        }
        .frame(maxWidth: 640)
        .padding(.horizontal)
        
        // MARK: - footer
        VStack(alignment: .center, spacing: 20) {
          Text(allAbout)
            .fontWeight(.bold)
            .modifier(TitleModifier())
          Text(everything)
            .font(.system(.body, design: .serif))
            .multilineTextAlignment(.center)
            .foregroundColor(.gray)
            .frame(minHeight: 60)
        } //: vstack w/ text
        .frame(maxWidth: 640)
        .padding()
        .padding(.bottom, 85)
        
      } //: vstack
      
    }
    .edgesIgnoringSafeArea(.all)
    .padding(0)
    
  } //: body
} //: struct

struct TitleModifier: ViewModifier {
  func body(content: Content) -> some View {
    content
      .font(.system(.title, design: .serif))
      .foregroundColor(greenAdaptive)
      .padding(8)
  }
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView(headers: headerData, facts: factData, recipes: recipeData)
      .previewDevice("iPhone 13")
  }
}
