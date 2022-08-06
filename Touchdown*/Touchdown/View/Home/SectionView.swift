//
//  SectionView.swift
//  Touchdown
//
//  Created by Maja Wirkijowska on 7/1/22.
//

import SwiftUI

struct SectionView: View {
  // MARK: - props
  @State var rotateClockwise: Bool
  
  // MARK: - body
  var body: some View {
  
    VStack(spacing: 0) {
      
      Spacer()
      
      Text("Categories".uppercased())
        .font(.footnote)
        .fontWeight(.bold)
        .foregroundColor(.white)
        .rotationEffect(Angle(degrees: rotateClockwise ? 90 : -90))
      
      Spacer()
      
    } //: vstack
    .background(colorGray.cornerRadius(12))
    .frame(width: 85)
  
  } //: body
}

// MARK: - preview
struct SectionView_Previews: PreviewProvider {
  static var previews: some View {
    SectionView(rotateClockwise: true)
      .previewLayout(.fixed(width: 120, height: 240))
      .padding()
      .background(colorBackground)
  }
}
