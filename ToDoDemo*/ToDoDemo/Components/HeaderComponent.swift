//
//  HeaderView.swift
//  Demo
//
//  Created by Maja Wirkijowska on 7/11/22.
//

import SwiftUI

struct HeaderComponent: View {
  // MARK: - props
  let dateTime: Date = Date()
  
  // MARK: - body
  var body: some View {
    
    VStack {
      
      Text(appTitle)
        .font(.largeTitle)
        .fontWeight(.black)
        .foregroundColor(veryLight)
        .padding()
        .shadow(color: .black, radius: 2, x: 0, y: 4)

      // today's date
      Text((dateFormatter.string(from: dateTime)))
        .foregroundColor(veryLight)
        .font(.title3)
        .fontWeight(.semibold)
    }
    
  }
}

struct HeaderView_Previews: PreviewProvider {
  static var previews: some View {
    HeaderComponent()
  }
}
