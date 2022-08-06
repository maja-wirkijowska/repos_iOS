//
//  NavigationBarView.swift
//  Touchdown
//
//  Created by Maja Wirkijowska on 7/1/22.
//

import SwiftUI

struct NavigationBarView: View {
  // MARK: - props
  @State private var isAnimated: Bool = false
  
  // MARK: - body
  var body: some View {
  
    HStack {
      
      Button(action: {}, label: {
        Image(systemName: "magnifyingglass")
          .font(.title)
          .foregroundColor(.black)
      }) //: search button
      
      Spacer()
      
      LogoView()
        .opacity(isAnimated ? 1 : 0)
        .offset(x: 0, y: isAnimated ? 0 : -0.25)
        .onAppear(perform: {
          withAnimation(.easeOut(duration: 0.5)) {
            isAnimated.toggle()
          }
        })
      
      Spacer()
      
      Button(action: {}, label: {
        ZStack {
          
          Image(systemName: "cart")
            .font(.title)
            .foregroundColor(.black)
          
          Circle()
            .fill(Color.red)
            .frame(width: 14, height: 14, alignment: .center)
            .offset(x: 13, y: -10)
          
        } //: zstack
      }) //: cart button
      
    } //: hstack
    
  } //: body
}

// MARK: - preview
struct NavigationBarView_Previews: PreviewProvider {
  static var previews: some View {
    NavigationBarView()
      .previewLayout(.sizeThatFits)
      .padding()
  }
}
