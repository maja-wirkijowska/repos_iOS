//
//  BlankView.swift
//  Devote
//
//  Created by Maja Wirkijowska on 7/5/22.
//

import SwiftUI

struct BlankView: View {
  // MARK: - props
  var backgroundColor: Color
  var backgroundOpacity: Double
  
  // MARK: - body
  var body: some View {
    
    VStack{
      Spacer()
    }
    .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity, alignment: .center)
    .background(backgroundColor)
    .opacity(backgroundOpacity)
    .blendMode(.overlay)
    .edgesIgnoringSafeArea(.all)
    
  } //: body
}

// MARK: - preview
struct BlankView_Previews: PreviewProvider {
  static var previews: some View {
    BlankView(backgroundColor: Color.black, backgroundOpacity: 0.3)
      .background(BackgroundImageView())
      .background(backgroundGradient.ignoresSafeArea(.all))
  }
}
