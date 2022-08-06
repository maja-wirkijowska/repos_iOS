//
//  GalleryView.swift
//  Africa
//
//  Created by Maja Wirkijowska on 6/29/22.
//

import SwiftUI

struct GalleryView: View {
  // MARK: - props
  let animals: [Animal] = Bundle.main.decode("animals.json")
  let haptics = UIImpactFeedbackGenerator(style: .medium)
  @State private var selectedAnimal: String = "lion"
  //let gridLayout: [GridItem] = Array(repeating: GridItem(.flexible()), count: 3)
  // DYNAMIC GRID LAYOUT
  @State private var gridLayout: [GridItem] = [GridItem(.flexible())]
  @State private var gridColumn: Double = 3.0
  
  // MARK: - functions
  func gridSwitch() {
    gridLayout = Array(repeating: .init(.flexible()), count: Int(gridColumn))
  }
  
  // MARK: - body
  var body: some View {
    
    ScrollView(.vertical, showsIndicators: false) {
      
      VStack(alignment: .center, spacing: 30) {
        // MARK: - image
        Image(selectedAnimal)
          .resizable()
          .scaledToFit()
          .clipShape(Circle())
          .overlay(Circle().stroke(Color.white, lineWidth: 8))
        
        // MARK: - slider
        Slider(value: $gridColumn, in: 2 ... 4, step: 1)
          .padding(.horizontal)
          .onChange(of: gridColumn, perform: { value in
            gridSwitch()
          })
        
        // MARK: - grid
        LazyVGrid(columns: gridLayout, alignment: .center, spacing: 10) {
          ForEach(animals) { item in
            Image(item.image)
              .resizable()
              .scaledToFit()
              .clipShape(Circle())
              .overlay(Circle().stroke(Color.white, lineWidth: 1))
              .onTapGesture {
                selectedAnimal = item.image
                haptics.impactOccurred()
              }
          } //: loop
          
        } //: vgrid
        .animation(.easeIn)
        .onAppear(perform: {
          gridSwitch()
        })
        
      } //: vstack
      .padding(.horizontal, 10)
      .padding(.vertical, 50)
      
    } //: scroll
    .frame(maxWidth: .infinity, maxHeight: .infinity)
    .background(MotionAnimationView())
    
  } //: body
}

// MARK: - preview
struct GalleryView_Previews: PreviewProvider {
  static var previews: some View {
    GalleryView()
  }
}
