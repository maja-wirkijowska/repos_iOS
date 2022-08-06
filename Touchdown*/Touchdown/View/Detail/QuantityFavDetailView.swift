//
//  QuantityFavDetailView.swift
//  Touchdown
//
//  Created by Maja Wirkijowska on 7/1/22.
//

import SwiftUI

struct QuantityFavDetailView: View {
  // MARK: - props
  @State private var counter: Int = 0
  
  // MARK: - body
  var body: some View {
  
    HStack(alignment: .center, spacing: 6, content: {
      
      Button(action: {
        if (counter > 0) {
          feedback.impactOccurred()
          counter -= 1
        }
      }, label: {
        Image(systemName: "minus.circle")
      }) //: minus button
      
      Text("\(counter)")
        .fontWeight(.semibold)
        .frame(minWidth: 36)
      
      Button(action: {
        if (counter < 100) {
          feedback.impactOccurred()
          counter += 1
        }
      }, label: {
        Image(systemName: "plus.circle")
      }) //: plus button
      
      Spacer()
      
      Button(action: {
        feedback.impactOccurred()
      }, label: {
        Image(systemName: "heart.circle")
          .foregroundColor(.pink)
      }) //: heart button
      
    }) //: hstack
    .font(.system(.title, design: .rounded))
    .foregroundColor(.black)
    .imageScale(.large)
    
  } //: body
}

struct QuantityFavDetailView_Previews: PreviewProvider {
  static var previews: some View {
    QuantityFavDetailView()
      .previewLayout(.sizeThatFits)
      .padding()
  }
}
