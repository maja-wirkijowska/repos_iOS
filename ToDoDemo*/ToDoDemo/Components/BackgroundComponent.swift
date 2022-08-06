//
//  BackgroundView.swift
//  Demo
//
//  Created by Maja Wirkijowska on 7/8/22.
//

import SwiftUI

struct BackgroundComponent: View {
  var body: some View {
    
    VStack {
      Spacer()
      HStack{
        Spacer()
      }
    }
    .background(LinearGradient(gradient: backgroundGradient, startPoint: .top, endPoint: .bottom))
    .edgesIgnoringSafeArea(.all)
    
  }
}

struct BackgroundView_Previews: PreviewProvider {
  static var previews: some View {
    BackgroundComponent()
  }
}
