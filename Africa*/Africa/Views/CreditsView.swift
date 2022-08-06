//
//  CreditsView.swift
//  Africa
//
//  Created by Maja Wirkijowska on 6/30/22.
//

import SwiftUI

struct CreditsView: View {
  var body: some View {
    VStack {
      Image("compass")
        .resizable()
        .scaledToFit()
        .frame(width: 128, height: 128)
      Text("""
      Copyright © Robert Peras
      Maja Wirkijowska
      All Rights Reserved
      Better Apps ♡ Less Code
      """)
      .font(.footnote)
    .multilineTextAlignment(.center)
    } //: vstack
    .padding()
    .opacity(0.4)
  }
}

struct CreditsView_Previews: PreviewProvider {
  static var previews: some View {
    CreditsView()
      .previewLayout(.sizeThatFits)
      .padding()
  }
}
