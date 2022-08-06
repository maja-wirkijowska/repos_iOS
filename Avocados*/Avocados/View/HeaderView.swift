//
//  HeaderView.swift
//  Avocados
//
//  Created by Maja Wirkijowska on 7/7/22.
//

import SwiftUI

struct HeaderView: View {
  // MARK: - props
  @State private var showHeadline: Bool = false
  var slideInAnimation: Animation {
    Animation.spring(response: 1.5, dampingFraction: 0.5, blendDuration: 0.5)
      .speed(1)
      .delay(0.25)
  }
  var header: Header
  
  // MARK: - body
  var body: some View {
    
    ZStack {
      
      Image(header.image)
        .resizable()
        .scaledToFill()
      
      HStack(alignment: .top, spacing: 0) {
        Rectangle()
          .fill(greenLight)
          .frame(width: 4)
        
        VStack {
          Text(header.headline)
            .font(.system(.title, design: .serif))
            .fontWeight(.bold)
            .foregroundColor(.white)
            .shadow(radius: 3)
          
          Text(header.subheadline)
            .font(.footnote)
            .lineLimit(2)
            .multilineTextAlignment(.leading)
            .foregroundColor(.white)
            .shadow(radius: 3)
          
        } //: vstack
        .padding(.vertical, 0)
        .padding(.horizontal, 20)
        .frame(width: 281, height: 105)
      .background(blackLight)
      } //: hstack
      .frame(width: 285, height: 105, alignment: .center)
      .offset(x: -66, y: showHeadline ? 75 : 220)
      .animation(slideInAnimation, value: showHeadline)
      .onAppear(perform: {
        self.showHeadline.toggle()
      })
      
    } //: zstack
    .frame(width: 480, height: 320, alignment: .center)
    
  } //: body
} //: struct

// MARK: - preview
struct HeaderView_Previews: PreviewProvider {
  static var previews: some View {
    HeaderView(header: headerData[0])
      .previewLayout(.sizeThatFits)
      .environment(\.colorScheme, .dark)
  }
}
