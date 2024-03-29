//
//  DishesView.swift
//  Avocados
//
//  Created by Maja Wirkijowska on 7/7/22.
//

import SwiftUI

struct DishesView: View {
  // MARK: - props
  
  // MARK: - body
  var body: some View {
    
    HStack(alignment: .center, spacing: 4) {
      
      // MARK: - first column
      VStack(alignment: .leading, spacing: 4) {
        HStack {
          Image("icon-toasts")
            .resizable()
            .modifier(IconModifier())
          Spacer()
          Text("Toast")
        }
        Divider()
        HStack {
          Image("icon-tacos")
            .resizable()
            .modifier(IconModifier())
          Spacer()
          Text("Tacos")
        }
        Divider()
        HStack {
          Image("icon-salads")
            .resizable()
            .modifier(IconModifier())
          Spacer()
          Text("Salads")
        }
        Divider()
        HStack {
          Image("icon-halfavo")
            .resizable()
            .modifier(IconModifier())
          Spacer()
          Text("Spreads")
        }
      }
      
      // MARK: - second column
      VStack(alignment: .center, spacing: 16) {
        HStack {
          Divider()
        }
        Image(systemName: "heart.circle")
          .font(Font.title.weight(.ultraLight))
          .imageScale(.large)
        HStack {
          Divider()
        }
      }
      
      // MARK: - third column
      VStack(alignment: .trailing, spacing: 4) {
        HStack {
          Text("Guacamole")
          Spacer()
          Image("icon-guacamole")
            .resizable()
            .modifier(IconModifier())
        }
        Divider()
        HStack {
          Text("Sandwiches")
          Spacer()
          Image("icon-sandwiches")
            .resizable()
            .modifier(IconModifier())
        }
        Divider()
        HStack {
          Text("Soups")
          Spacer()
          Image("icon-soup")
            .resizable()
            .modifier(IconModifier())
        }
        Divider()
        HStack {
          Text("Smoothies")
          Spacer()
          Image("icon-smoothies")
            .resizable()
            .modifier(IconModifier())
        }
      }
    }
    .font(.system(.callout, design: .serif))
    .foregroundColor(.gray)
    .padding(.horizontal)
    .frame(maxHeight: 220)
    
  } //: body
} //: struct

struct IconModifier: ViewModifier {
  func body(content: Content) -> some View {
    content
      .frame(width: 42, height: 42, alignment: .center)
  }
}

// MARK: - preview
struct DishesView_Previews: PreviewProvider {
  static var previews: some View {
    DishesView()
      .previewLayout(.fixed(width: 414, height: 280))
  }
}
