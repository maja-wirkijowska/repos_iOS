//
//  FactsView.swift
//  Avocados
//
//  Created by Maja Wirkijowska on 7/7/22.
//

import SwiftUI

struct FactsView: View {
  // MARK: - props
  var fact: Fact
  
  // MARK: - body
  var body: some View {
    
    ZStack {
      Text(fact.content)
        .padding(.leading, 55)
        .padding(.trailing, 10)
        .padding(.vertical, 3)
        .frame(width: 300, height: 135, alignment: .center)
        .background(
          LinearGradient(gradient: Gradient(colors: [greenMedium, greenLight]), startPoint: .leading, endPoint: .trailing)
        )
        .cornerRadius(12)
        .lineLimit(6)
        .multilineTextAlignment(.leading)
        .font(.footnote)
        .foregroundColor(.white)
      
      Image(fact.image)
        .resizable()
        .frame(width: 66, height: 66, alignment: .center)
        .clipShape(Circle())
        .background(
          Circle()
            .fill(.white)
            .frame(width: 74, height: 74, alignment: .center)
        )
        .background(
          Circle()
            .fill(LinearGradient(gradient: Gradient(colors: [greenMedium, greenLight]), startPoint: .trailing, endPoint: .leading))
            .frame(width: 82, height: 82, alignment: .center)
        )
        .background(
          Circle()
            .fill(appearAdaptive)
            .frame(width: 90, height: 90, alignment: .center)
        )
        .offset(x: -150)
    }
    
  } //: body
} //: struct

// MARK: - preview
struct FactsView_Previews: PreviewProvider {
  static var previews: some View {
    FactsView(fact: factData[0])
      .previewLayout(.fixed(width: 400, height: 220))
      .preferredColorScheme(.light)
  }
}
