//
//  AnimalGridItemView.swift
//  Africa
//
//  Created by Maja Wirkijowska on 6/30/22.
//

import SwiftUI

struct AnimalGridItemView: View {
  // MARK: - props
  let animal: Animal
  
  // MARK: - body
  var body: some View {
    
    Image(animal.image)
      .resizable()
      .scaledToFit()
      .cornerRadius(12)
    
  } //: body
}

// MARK: - preview
struct AnimalGridItemView_Previews: PreviewProvider {
  static let animals: [Animal] = Bundle.main.decode("animals.json")
  
  static var previews: some View {
    AnimalGridItemView(animal: animals[0])
      .previewLayout(.sizeThatFits)
      .padding()
  }
}
