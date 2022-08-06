//
//  LogoView.swift
//  Touchdown
//
//  Created by Maja Wirkijowska on 7/1/22.
//

import SwiftUI

struct LogoView: View {
  // MARK: - props
  
  // MARK: - body
  var body: some View {
    
    HStack(spacing: 4) {
      
      Text("TOUCH".uppercased())
        .font(.title3)
        .fontWeight(.black)
        .foregroundColor(.black)
      
      Image("logo-dark")
        .resizable()
        .scaledToFit()
        .frame(width: 30, height: 30, alignment: .center)
      
      Text("DOWN".uppercased())
        .font(.title3)
        .fontWeight(.black)
        .foregroundColor(.black)
      
    } //: hstack
    
  } //: body
}

// MARK: - preview
struct LogoView_Previews: PreviewProvider {
  static var previews: some View {
    LogoView()
      .previewLayout(.sizeThatFits)
      .padding()
  }
}
