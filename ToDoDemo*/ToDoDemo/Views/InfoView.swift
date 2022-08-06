//
//  InfoView.swift
//  ToDoDemo
//
//  Created by Maja Wirkijowska on 7/14/22.
//

import SwiftUI

struct InfoView: View {
  // MARK: - props
  @Environment(\.presentationMode) var presentationMode
  
  // MARK: - body
  var body: some View {
    
    VStack(alignment: .center, spacing: 12) {
      HeaderComponent()
      Spacer()
      
      Form {
        Section(header: Text("About To Do Demo App")) {
          FormRowView(left: "Application", right: "To Do Demo")
          FormRowView(left: "Platforms", right: "iPhone")
          FormRowView(left: "Developer", right: "Maja Wirkijowska")
          FormRowView(left: "Version", right: "1.3.0")
        }
      }
      .font(.system(.body, design: .rounded))
      
    }
    .padding(.top, 40)
    .overlay(
      Button(action: {
        self.presentationMode.wrappedValue.dismiss()
      }, label: {
        Image(systemName: "xmark.circle")
          .font(.title)
      })
      .padding(.top, 30)
      .padding(.bottom)
      .padding(.trailing, 20)
      .accentColor(veryLight)
      , alignment: .topTrailing
    ) //: overlay - button
    .background(blueDark)
  }
}

// MARK: - FormRowView
struct FormRowView: View {
  var left: String
  var right: String
  
  var body: some View {
    HStack {
      Text(left).foregroundColor(.gray)
      Spacer()
      Text(right).foregroundColor(blueDark)
    }
  }
}

// MARK: - preview
struct InfoView_Previews: PreviewProvider {
  static var previews: some View {
    InfoView()
  }
}
