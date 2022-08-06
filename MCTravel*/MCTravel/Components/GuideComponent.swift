//
//  GuideComponent.swift
//  MCTravel
//
//  Created by Maja Wirkijowska on 7/18/22.
//

import SwiftUI

struct GuideComponent: View {
  // MARK: - props
  var title: String
  var subtitle: String
  var description: String
  var icon: String
  
  // MARK: - body
  var body: some View {
    
    HStack(alignment: .center, spacing: 20, content: {
      Image(systemName: icon)
        .font(.largeTitle)
        .foregroundColor(.pink)
      
      VStack(alignment: .leading, spacing: 4, content: {
        HStack {
          Text(title.uppercased())
            .font(.title)
            .fontWeight(.heavy)
          Spacer()
          Text(subtitle.uppercased())
            .font(.footnote)
            .fontWeight(.heavy)
            .foregroundColor(.pink)
        } //: hstack - inside vstack
        Divider().padding(.bottom, 4)
        Text(description)
          .font(.footnote)
          .foregroundColor(.secondary)
          .fixedSize(horizontal: false, vertical: true)
      }) //: vstack -
      
    }) //: hstack - main
    
  } //: body -
} //: struct -

// MARK: - preview
struct GuideComponent_Previews: PreviewProvider {
  static var previews: some View {
    GuideComponent(
      title: "Title",
      subtitle: "Right",
      description: "Placeholder text. Placeholder text. Placeholder text. Placeholder text. Placeholder text.",
      icon: "heart.circle")
      .previewLayout(.sizeThatFits)
  }
}
