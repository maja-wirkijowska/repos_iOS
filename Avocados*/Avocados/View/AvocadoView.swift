//
//  AvocadoView.swift
//  Avocados
//
//  Created by Maja Wirkijowska on 7/7/22.
//

import SwiftUI

struct AvocadoView: View {
  // MARK: - props
  @State private var pulsateAnimation: Bool = false
  
  // MARK: - body
  var body: some View {
    
    VStack {
      Spacer()
      
      Image("avocado")
        .resizable()
        .aspectRatio(contentMode: .fit)
        .frame(width: 240, height: 240, alignment: .center)
        .shadow(color: blackDark, radius: 12, x: 0, y: 8)
        .scaleEffect(self.pulsateAnimation ? 1 : 0.9)
        .opacity(self.pulsateAnimation ? 1 : 0.9)
        .animation(Animation.easeInOut(duration: 1.5).repeatForever(), value: pulsateAnimation)
      
      VStack {
        Text("Avocados".uppercased())
          .font(.system(size: 42, weight: .bold, design: .serif))
          .foregroundColor(.white)
          .padding()
          .shadow(color: blackDark, radius: 4, x: 0, y: 4)
        
        Text(creamyGreenString)
          .multilineTextAlignment(.center)
          .font(.system(.headline, design: .serif))
          .foregroundColor(greenLight)
          .lineSpacing(8)
          .frame(maxWidth: 640, minHeight: 120)
      } //: vstack
      .padding()
      
      Spacer()
    }
    .background(
      Image("background")
        .resizable()
        .aspectRatio(contentMode: .fill)
    )
    .edgesIgnoringSafeArea(.all)
    .onAppear(perform: {
      self.pulsateAnimation.toggle()
    })
    
  } //: body
} //: struct

// MARK: - preview
struct AvocadoView_Previews: PreviewProvider {
  static var previews: some View {
    Group {
      AvocadoView()
        .preferredColorScheme(.light)
        .previewDevice("iPhone 13")
      AvocadoView()
        .preferredColorScheme(.dark)
        .previewDevice("iPhone 13")
    }
    
  }
}
