//
//  BackgroundImageView.swift
//  Devote
//
//  Created by Maja Wirkijowska on 7/5/22.
//

import SwiftUI

struct BackgroundImageView: View {
  // MARK: - props
  
  // MARK: - body
  var body: some View {
   
    Image("rocket")
      .antialiased(true) // keeps edges of image smooth when it is scaled up or down
      .resizable()
      .scaledToFill()
      .ignoresSafeArea(.all)
    
  } //: body
}

// MARK: - preview 
struct BackgroundImageView_Previews: PreviewProvider {
  static var previews: some View {
    BackgroundImageView()
  }
}
