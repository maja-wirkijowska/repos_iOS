//
//  CreditsView.swift
//  Notes WatchKit Extension
//
//  Created by Maja Wirkijowska on 7/6/22.
//

import SwiftUI

struct CreditsView: View {
  // MARK: - props
  @State private var randomNumber: Int = Int.random(in: 1 ..< 4)
  
  private var randomImage: String {
    return "developer-no\(randomNumber)"
  }
  
  // MARK: - body
  var body: some View {
    
    VStack(spacing: 3) {
      // profile image
      Image("developer-no2")
        .resizable()
        .scaledToFit()
        .layoutPriority(1)
      
      // header
      HeaderView(title: "Credits")
      
      // content
      Text("Maja Wirkijowska")
        .foregroundColor(.primary)
        .fontWeight(.bold)
      Text("Developer")
        .font(.footnote)
        .foregroundColor(.secondary)
        .fontWeight(.light)
      
    } //: vstack
    
  } //: body
} //: struct

// MARK: - preview
struct CreditsView_Previews: PreviewProvider {
  static var previews: some View {
    CreditsView()
  }
}
