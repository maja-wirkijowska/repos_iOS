//
//  CardView.swift
//  MCTravel
//
//  Created by Maja Wirkijowska on 7/18/22.
//

import SwiftUI

struct CardView: View, Identifiable {
  // MARK: - props
  let id = UUID()
  let destination: Destination
  
  // MARK: - body
  var body: some View {
    
    Image(destination.image)
      .resizable()
      .cornerRadius(24)
      .scaledToFit()
      .frame(minWidth: 0, maxWidth: .infinity)
      .overlay(
        VStack(alignment: .center, spacing: 12) {
          Text(destination.place.uppercased())
            .foregroundColor(.white)
            .font(.largeTitle)
            .fontWeight(.bold)
            .shadow(radius: 1)
            .padding(.horizontal, 18)
            .padding(.vertical, 4)
            .overlay(
              Rectangle()
                .fill(.white)
                .frame(height: 1),
              alignment: .bottom
            ) //: overlay - text.destination.place
          Text(destination.country.uppercased())
            .foregroundColor(.black)
            .font(.footnote)
            .fontWeight(.bold)
            .frame(minWidth: 85)
            .padding(.horizontal, 10)
            .padding(.vertical, 5)
            .background(
              Capsule().fill(.white)
            ) //: background - text.destination.country
        } //: vstack - image.overlay
        .frame(minWidth: 280)
        .padding(.bottom, 50),
        alignment: .bottom
      ) //: overlay - image
    
  } //: body -
}//: struct

// MARK: - preview
struct CardView_Previews: PreviewProvider {
  static var previews: some View {
    CardView(destination: destinationData[0])
      .previewLayout(.fixed(width: 375, height: 600))
  }
}
