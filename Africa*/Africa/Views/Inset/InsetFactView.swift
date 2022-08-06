//
//  InsetFactView.swift
//  Africa
//
//  Created by Maja Wirkijowska on 6/29/22.
//

import SwiftUI

struct InsetFactView: View {
  // MARK: - props
  let animal: Animal
  
  // MARK: - body
  var body: some View {
    
    GroupBox {
      TabView {
        ForEach(animal.fact, id: \.self) { item in
          Text(item)
        }
      } //: tab view
      .tabViewStyle(PageTabViewStyle())
      .frame(minHeight: 148, idealHeight: 168, maxHeight: 180)
      
    } //: box
    
  } //: body
}

// MARK: - preview
struct InsetFactView_Previews: PreviewProvider {
  static let animals: [Animal] = Bundle.main.decode("animals.json")

  static var previews: some View {
    InsetFactView(animal: animals[0])
      .previewLayout(.sizeThatFits)
      .padding()
  }
}
