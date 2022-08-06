//
//  ListRowTaskView.swift
//  Demo
//
//  Created by Maja Wirkijowska on 7/11/22.
//

import SwiftUI

struct TaskItemView: View {
  // MARK: - props
  @Environment(\.managedObjectContext) var viewContext
  @ObservedObject var item: Item
  @State private var isCompleted: Bool = false
  
  // MARK: - body
  var body: some View {
    
    HStack {
      VStack(alignment: .leading, spacing: 12) {
        Text(item.name ?? "")
          .font(.title3)
          .fontWeight(.bold)
          .foregroundColor(blueDark)
        Text("Due: \(dateFormatter.string(from: item.due ?? Date()))")
          .font(.body)
          .multilineTextAlignment(.leading)
          .foregroundColor(blueDark)
        
      }
      .padding()
      
      Spacer()
      
      if (item.completed) {
        Image(systemName: "checkmark.circle.fill")
          .foregroundColor(myGreen)
          .font(.system(size: 50, weight: .black))
          
      }
      
    } //: hstack
    
  }
}


