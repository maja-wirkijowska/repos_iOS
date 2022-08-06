//
//  ContentView.swift
//  Africa
//
//  Created by Maja Wirkijowska on 6/29/22.
//

import SwiftUI

struct ContentView: View {
  // MARK: - props
  let animals: [Animal] = Bundle.main.decode("animals.json")
  let haptics = UIImpactFeedbackGenerator(style: .medium)
  //let gridLayout: [GridItem] = Array(repeating: GridItem(.flexible()), count: 2)
  @State private var gridLayout: [GridItem] = [ GridItem(.flexible()) ]
  @State private var isGridViewActive: Bool = false
  @State private var gridColumn: Int = 1
  @State private var toolBarIcon: String = "square.grid.2x2"
  
  // MARK: - functions
  func gridSwitch() {
    gridLayout = Array(repeating: .init(.flexible()), count: (gridLayout.count % 3 + 1))
    gridColumn = gridLayout.count
    print("grid number: \(gridColumn)")
    
    // toolbar image
    switch (gridColumn) {
    case 1:
      toolBarIcon = "square.grid.2x2"
    case 2:
      toolBarIcon = "square.grid.3x2"
    case 3:
      toolBarIcon = "rectangle.grid.1x2"
    default:
      toolBarIcon = "square.grid.2x2"
    }
  }
  
  // MARK: - body
  var body: some View {
    NavigationView {
      
      Group {
        if (!isGridViewActive) {
          List {
            CoverImageView()
              .frame(height: 300)
              .listRowInsets(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0))
            
            ForEach(animals) { animal in
              NavigationLink(destination: AnimalDetailView(animal: animal)) {
                AnimalListItemView(animal: animal)
              } //: nav link
              
            } //: loop
            
            CreditsView()
              .modifier(CenterMod())
            
          } //: list
        } else {
          
          ScrollView(.vertical, showsIndicators: false) {
            LazyVGrid(columns: gridLayout, alignment: .center, spacing: 10) {
              ForEach(animals) { animal in
                NavigationLink(destination: AnimalDetailView(animal: animal)) {
                  AnimalGridItemView(animal: animal)
                } //: nav link
              } //: loop
            } //: vgrid
            .padding(10)
            .animation(.easeIn)
          } //: scroll
          
        } //: else 
        
      } //: group
      .navigationBarTitle("Africa", displayMode: .large)
      .toolbar {
        ToolbarItem(placement: .navigationBarTrailing) {
          HStack(spacing: 16) {
            
            // list button
            Button(action: {
              print("List view activated")
              isGridViewActive = false
              haptics.impactOccurred()
            }) {
              Image(systemName: "square.fill.text.grid.1x2")
                .font(.title2)
                .foregroundColor(isGridViewActive ? .primary : .accentColor)
            } //: list button
            
            // grid button
            Button(action: {
              print("Grid view activated")
              isGridViewActive = true
              haptics.impactOccurred()
              gridSwitch()
            }) {
              Image(systemName: toolBarIcon)
                .font(.title2)
                .foregroundColor(isGridViewActive ? .accentColor : .primary)
            } //: grid button
          } //: hstack
        } //: toolbar buttons
      } //: toolbar
    } //: nav view
  }
}

// MARK: - preview
struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView()
  }
}
