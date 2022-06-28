//
//  OnboardingView.swift
//  Fructus
//
//  Created by Maja Wirkijowska on 6/28/22.
//

import SwiftUI

struct OnboardingView: View {
    // MARK: -  props
    var fruits: [Fruit] = fruitsData
    
    // MARK: -  funcs
    
    // MARK: -  body
    var body: some View {
        TabView {
            ForEach(fruits[0...5]) { item in
                FruitCardView(fruit: item)
            } //: for each loop
        } //: tab view
        .tabViewStyle(PageTabViewStyle())
        .padding(.vertical, 20)
    }
}

// MARK: -  preview
struct OnboardingView_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingView(fruits: fruitsData)
    }
}
