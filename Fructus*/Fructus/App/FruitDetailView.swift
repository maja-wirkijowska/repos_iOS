//
//  FruitDetailView.swift
//  Fructus
//
//  Created by Maja Wirkijowska on 6/28/22.
//

import SwiftUI

struct FruitDetailView: View {
    // MARK: -  props
    var fruit: Fruit
    
    // MARK: -  funcs
    
    // MARK: -  body
    var body: some View {
        NavigationView {
            ScrollView(.vertical, showsIndicators: false) {
                VStack(alignment: .center, spacing: 20) {
                    // header
                    FruitHeaderView(fruit: fruit)
                    
                    VStack(alignment: .leading, spacing: 20) {
                        // title
                        Text(fruit.title)
                            .font(.largeTitle)
                            .fontWeight(.heavy)
                            .foregroundColor(fruit.gradientColors[1])
                        
                        // headline
                        Text(fruit.headline)
                            .font(.headline)
                            .multilineTextAlignment(.leading)
                        
                        // nutrients
                        FruitNutrientsView(fruit: fruit)
                        
                        // subheadline
                        Text("Learn more about \(fruit.title)".uppercased())
                            .fontWeight(.bold)
                            .foregroundColor(fruit.gradientColors[1])
                        
                        // description
                        Text(fruit.description)
                            .multilineTextAlignment(.leading)
                        
                        // link
                        SourceLinkView()
                            .padding(.top, 10)
                            .padding(.bottom, 40)
                        
                    } //: vstack
                    .padding(.horizontal, 20)
                    .frame(maxWidth: 649, alignment: .center) // iPad optimization
                    
                } //: vstack
                .navigationBarTitle(fruit.title, displayMode: .inline)
                .navigationBarHidden(true)
            } //: v scrol
            .edgesIgnoringSafeArea(.top)
        } //: nav view
        .navigationViewStyle(StackNavigationViewStyle())
    }
}

// MARK: -  preview
struct FruitDetailView_Previews: PreviewProvider {
    static var previews: some View {
        FruitDetailView(fruit: fruitsData[0])
    }
}
