//
//  ListRowItemView.swift
//  Devote
//
//  Created by Maja Wirkijowska on 7/5/22.
//

import SwiftUI

struct ListRowItemView: View {
  // MARK: - props
  @Environment(\.managedObjectContext) var viewContext
  @ObservedObject var item: Item // makes it possible to observe and save check box changes
  
  // MARK: - body
  var body: some View {
    
    Toggle(isOn: $item.completion) {
      Text(item.task ?? "")
        .font(.system(.title2, design: .rounded))
        .fontWeight(.heavy)
        .foregroundColor(item.completion ? Color.pink : Color.primary)
        .padding(.vertical, 12)
        .animation(.default, value: item.task)
    } //: toggle
    .toggleStyle(CheckBoxStyle())
    .onReceive(item.objectWillChange, perform: { _ in
      if self.viewContext.hasChanges {
        try? self.viewContext.save()
      }
    })
    
  } //: body
}

