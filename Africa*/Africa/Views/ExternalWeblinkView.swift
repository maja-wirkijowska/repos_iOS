//
//  ExternalWeblinkView.swift
//  Africa
//
//  Created by Maja Wirkijowska on 6/29/22.
//

import SwiftUI

struct ExternalWeblinkView: View {
  // MARK: - props
  let animal: Animal
  
  // MARK: - body
  var body: some View {
    GroupBox {
      
      HStack {
        Image(systemName: "globe")
        Text("Wikipedia")
        Spacer()
        
        Group {
          Image(systemName: "arrow.up.right.square")
          
          Link(animal.name, destination: (URL(string: animal.link) ?? URL(string: "https:wikipedia.org"))!)
        } //: group
        .foregroundColor(.accentColor)
        
      } //: hstack
      
    } //: group box
  }
}

// MARK: - preview
struct ExternalWeblinkView_Previews: PreviewProvider {
  static let animals: [Animal] = Bundle.main.decode("animals.json")
  
  static var previews: some View {
    ExternalWeblinkView(animal: animals[0])
      .previewLayout(.sizeThatFits)
      .padding()
  }
}
