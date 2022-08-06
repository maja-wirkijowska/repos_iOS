//
//  CardView.swift
//  Learn
//
//  Created by Maja Wirkijowska on 7/7/22.
//

import SwiftUI

struct CardView: View {
  // MARK: - props
  var card: Card
  var hapticImpact = UIImpactFeedbackGenerator(style: .heavy)
  @State private var fadeIn: Bool = false // marks prop as mutable after app starts
  @State private var moveDown: Bool = false
  @State private var moveUp: Bool = false
  @State private var showAlert: Bool = false
  
  // MARK: - body
  var body: some View {
    
    ZStack{
      Image(card.imageName)
        .opacity(fadeIn ? 1.0 : 0.0)
      
      VStack {
        Text(card.title)
          .foregroundColor(.white)
          .fontWeight(.heavy)
          .font(.largeTitle)
          .multilineTextAlignment(.center)
        Text(card.headline)
          .foregroundColor(.white)
          .fontWeight(.light)
          .italic()
      }
      .offset(y: moveDown ? -218 : -300)
      
      Button(action: {
        print("button tapped")
        playSound(sound: "sound-chime", type: "mp3")
        self.hapticImpact.impactOccurred()
        self.showAlert.toggle()
      }) {
        HStack {
          Text(card.callToAction.uppercased())
            .fontWeight(.heavy)
            .foregroundColor(.white)
          .accentColor(.white)
          
          Image(systemName: "arrow.right.circle")
            .font(Font.title.weight(.medium))
            .accentColor(.white)
        }
        .padding(.vertical)
        .padding(.horizontal, 24)
        .background(LinearGradient(gradient: Gradient(colors: card.gradientColors), startPoint: .leading, endPoint: .trailing))
        .clipShape(Capsule())
        .shadow(color: Color("ColorShadow"), radius: 3, x: 0, y: 3)
      }
      .offset(y: moveUp ? 210 : 300)
      
    } //: zstack
    .frame(width: 335, height: 545)
    .background(LinearGradient(gradient: Gradient(colors: card.gradientColors), startPoint: .top, endPoint: .bottom))
    .cornerRadius(16)
    .shadow(radius: 8)
    .onAppear() {
      withAnimation(.linear(duration: 1.2)) {
        self.fadeIn.toggle() // changes state of fadeIn from false to true
      } //: withAnimation 1.2
      withAnimation(.linear(duration: 0.8)) {
        self.moveDown.toggle()
        self.moveUp.toggle()
      } //: withAnimation 0.8
    } //: onAppear
    .alert(isPresented: $showAlert) {
      Alert(title: Text(card.title), message: Text(card.message), dismissButton: .default(Text("OK")))
    } //: alert
    
  } //: body
} //: struct

// MARK: - preview
struct CardView_Previews: PreviewProvider {
  static var previews: some View {
    CardView(card: cardData[1])
      .previewLayout(.sizeThatFits)
  }
}
