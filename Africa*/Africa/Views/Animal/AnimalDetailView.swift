//
//  AnimalDetailView.swift
//  Africa
//
//  Created by Maja Wirkijowska on 6/29/22.
//

import SwiftUI

struct AnimalDetailView: View {
  // MARK: - props
  let animal: Animal
  
  // MARK: - body
  var body: some View {
    ScrollView(.vertical, showsIndicators: false) {
      VStack(alignment: .center, spacing: 20) {
        // hero image
        Image(animal.image)
          .resizable()
          .scaledToFit()
        
        // title
        Text(animal.name.uppercased())
          .font(.largeTitle)
          .fontWeight(.heavy)
          .multilineTextAlignment(.center)
          .padding(.vertical, 8)
          .foregroundColor(.primary)
          .background(
            Color.accentColor
              .frame(height: 6)
              .offset(y: 24)
          )
        
        // headline
        Text(animal.headline)
          .font(.headline)
          .multilineTextAlignment(.leading)
          .foregroundColor(.accentColor)
          .padding(.horizontal)
        
        // gallery
        Group {
          HeadingView(headingImage: "photo.on.rectangle.angled", headingText: "Pictures")
          InsetGalleryView(animal: animal)
        } //: group 
        .padding(.horizontal)
        
        // facts
        Group {
          HeadingView(headingImage: "questionmark.circle", headingText: "Did You Know?")
          InsetFactView(animal: animal)
        } //: groups
        .padding(.horizontal)
        
        // description
        Group {
          HeadingView(headingImage: "info.circle", headingText: "All About \(animal.name)s")
          
          Text(animal.description)
            .multilineTextAlignment(.leading)
            .layoutPriority(1)
        } //: group
        .padding(.horizontal)
        
        // map
        Group {
          HeadingView(headingImage: "map", headingText: "National Parks")
          InsetMapView()
        } //: group
        .padding(.horizontal)
        
        // link
        Group {
          HeadingView(headingImage: "books.vertical", headingText: "Learn More")
          
          ExternalWeblinkView(animal: animal)
        }
        .padding(.horizontal)
        
        
      } //: vstack
      .navigationBarTitle("Learn About \(animal.name)s", displayMode: .inline)
      
    } //: scroll
  }
}

// MARK: - preview
struct AnimalDetailView_Previews: PreviewProvider {
  static let animals: [Animal] = Bundle.main.decode("animals.json")
  
  static var previews: some View {
    NavigationView {
      AnimalDetailView(animal: animals[0])
    }
    .previewDevice("iPhone 13")
    
  }
}
