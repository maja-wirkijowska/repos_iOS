//
//  HeaderView.swift
//  Notes WatchKit Extension
//
//  Created by Maja Wirkijowska on 7/6/22.
//

import SwiftUI

struct HeaderView: View {
  // MARK: - props
  var title: String = ""
  
  // MARK: - body
  var body: some View {
    VStack {
      // title
      if (title != "") {
        Text(title.uppercased())
          .font(.title3)
          .fontWeight(.bold)
          .foregroundColor(.accentColor)
      }
      
      //seperator
      HStack{
        Capsule()
          .frame(height: 1)
        
        Image(systemName: "note.text")
        
        Capsule()
          .frame(height: 1)
      } //:  hstack
      .foregroundColor(.accentColor)
    } //: vstack
  }
}

struct HeaderView_Previews: PreviewProvider {
  static var previews: some View {
    Group {
      HeaderView()
      
      HeaderView(title: "Credits")
    }
  }
}
