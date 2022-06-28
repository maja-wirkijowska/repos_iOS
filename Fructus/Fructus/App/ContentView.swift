//
//  ContentView.swift
//  Fructus
//
//  Created by Maja Wirkijowska on 6/28/22.
//

import SwiftUI

struct ContentView: View {
    // MARK: -  props
    var fruits: [Fruit] = fruitsData
    @State private var isShowingSettings: Bool = false
    
    // MARK: -  body
    var body: some View {
        NavigationView {
            List {
                ForEach(fruits.shuffled()) { item in
                    NavigationLink(destination: FruitDetailView(fruit: item)) {
                        FruitRowView(fruit: item)
                            .padding(.vertical, 4)
                    } //: nav link
                } //: for each
            } //: list
            .navigationTitle("Fruits")
            .navigationBarItems(     // showing/dismissing new sheet view
                trailing:
                    Button(action: {
                        isShowingSettings = true
                    }) {
                        Image(systemName: "slider.horizontal.3")
                    } //: button
                    .sheet(isPresented: $isShowingSettings) {
                        SettingsView()
                    }
            ) //: nav bar items
            
        } //: nav view
        .navigationViewStyle(StackNavigationViewStyle())
    }
}

// MARK: -  preview
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(fruits: fruitsData)
            .previewDevice("iPhone 11 Pro")
            .preferredColorScheme(.light)
        ContentView(fruits: fruitsData)
            .previewDevice("iPhone 13 Pro")
            .preferredColorScheme(.dark)

    }
}
