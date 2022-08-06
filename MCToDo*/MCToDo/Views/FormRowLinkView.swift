//
//  FormRowLinkView.swift
//  MCToDo
//
//  Created by Maja Wirkijowska on 7/15/22.
//

import SwiftUI

struct FormRowLinkView: View {
  // MARK: - props
  var icon: String
  var color: Color
  var text: String
  var link: String
  
  // MARK: - body
  var body: some View {
    
    HStack {
      ZStack {
        RoundedRectangle(cornerRadius: 8, style: .continuous).fill(color)
        Image(systemName: icon).imageScale(.large).foregroundColor(.white)
      } //: zstack -
      .frame(width: 36, height: 36, alignment: .center)
      
      Text(text).foregroundColor(.gray)
      Spacer()
      Button(action: {
        guard let url = URL(string: self.link), UIApplication.shared.canOpenURL(url) else { return }
        UIApplication.shared.open(url as URL)
      }, label: {
        Image(systemName: "chevron.right").font(.system(size: 14, weight: .semibold, design: .rounded))
      })
      .accentColor(Color(.systemGray2))
    }
    
  } //: body -
} //: struct -

// MARK: - preview
struct FormRowLinkView_Previews: PreviewProvider {
  static var previews: some View {
    FormRowLinkView(icon: "globe", color: .pink, text: "Website", link: "https://swiftuimasterclass.com")
      .previewLayout(.fixed(width: 375, height: 60))
      .padding()
  }
}
