//
//  RipeningView.swift
//  Avocados
//
//  Created by Maja Wirkijowska on 7/7/22.
//

import SwiftUI

struct RipeningView: View {
  // MARK: - props
  @State private var slideInAnimation: Bool = false
  var ripening: Ripening
  
  // MARK: - body
  var body: some View {
    
    VStack {
      Image(ripening.image)
        .resizable()
        .frame(width: 100, height: 100, alignment: .center)
        .clipShape(Circle())
        .background(
          Circle()
            .fill(greenLight)
            .frame(width: 110, height: 110, alignment: .center)
        )
        .background(
          Circle()
            .fill(appearAdaptive)
            .frame(width: 120, height: 120, alignment: .center)
        )
        .zIndex(1)
        .animation(Animation.easeInOut(duration: 1), value: slideInAnimation)
        .offset(y: slideInAnimation ? 55 : -55)
      
      VStack(alignment: .center, spacing: 10) {
        // stage
        VStack(alignment: .center, spacing: 0) {
          Text(ripening.stage)
            .font(.system(.largeTitle, design: .serif))
            .fontWeight(.bold)
          Text("Stage".uppercased())
            .font(.system(.body,design: .serif))
            .fontWeight(.heavy)
        }
        .foregroundColor(greenMedium)
        .padding(.top, 65)
        .frame(width: 180)
        
        // title
        Text(ripening.title)
          .font(.system(.title, design: .serif))
          .fontWeight(.bold)
          .foregroundColor(greenMedium)
          .padding(.vertical, 12)
          .padding(.horizontal, 0)
          .frame(width: 220)
          .background(
            RoundedRectangle(cornerRadius: 12)
              .fill(LinearGradient(gradient: Gradient(colors: [.white, greenLight]), startPoint: .top, endPoint: .bottom))
              .shadow(color: blackLight, radius: 6, x: 0, y: 6)
          )
          
        // description
        Spacer()
        Text(ripening.description)
          .foregroundColor(greenDark)
          .fontWeight(.bold)
          .lineLimit(nil)
        Spacer()
        
        // ripeness
        Text(ripening.ripeness.uppercased())
          .foregroundColor(.white)
          .font(.system(.callout, design: .serif))
          .fontWeight(.bold)
          .shadow(radius: 3)
          .padding(.vertical)
          .padding(.horizontal, 0)
          .frame(width: 185)
          .background(
            RoundedRectangle(cornerRadius: 12)
              .fill(LinearGradient(gradient: Gradient(colors: [greenMedium, greenDark]), startPoint: .top, endPoint: .bottom))
              .shadow(color: blackLight, radius: 6, x: 0, y: 6)
          )
        
        // instruction
        Text(ripening.instruction)
          .font(.footnote)
          .foregroundColor(greenLight)
          .fontWeight(.bold)
          .lineLimit(3)
          .frame(width: 160)
        
        Spacer()
      
      }
      .zIndex(0)
      .multilineTextAlignment(.center)
      .padding(.horizontal)
      .frame(width: 260, height: 485, alignment: .center)
      .background(
        LinearGradient(gradient: Gradient(colors: [greenLight, greenMedium]), startPoint: .top, endPoint: .bottom)
      )
      .cornerRadius(20)
    }
    .edgesIgnoringSafeArea(.all)
    .onAppear(perform: {
      self.slideInAnimation.toggle()
    })
  }
}

struct RipeningView_Previews: PreviewProvider {
  static var previews: some View {
    RipeningView(ripening: ripeningData[0])
  }
}
