//
//  FormRowStaticView.swift
//  MCToDo
//
//  Created by Maja Wirkijowska on 7/15/22.
//

import SwiftUI

struct FormRowStaticView: View {
  // MARK: - props
  var icon: String
  var left: String
  var right: String
  
  // MARK: - body
  var body: some View {
    
    HStack {
      ZStack{
        RoundedRectangle(cornerRadius: 8, style: .continuous).fill(.gray)
        Image(systemName: icon).foregroundColor(.white)
      }
      .frame(width: 36, height: 36, alignment: .center)
      
      Text(left).foregroundColor(.gray)
      Spacer()
      Text(right)
      
    } //: hstack -
    
  } //: body - 
}//: struct -

// MARK: - preview
struct FormRowStaticView_Previews: PreviewProvider {
  static var previews: some View {
    FormRowStaticView(icon: "gear", left: "Application", right: "To Do")
      .previewLayout(.fixed(width: 375, height: 60))
      .padding()
  }
}
