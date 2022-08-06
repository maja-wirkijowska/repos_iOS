//
//  TaskCompletedView.swift
//  ToDoDemo
//
//  Created by Maja Wirkijowska on 7/12/22.
//

import SwiftUI

struct TaskCompletedView: View {
  // MARK: - props
  @Environment(\.managedObjectContext) var viewContext
  @ObservedObject var item: Item
  @State private var isCompleted: Bool = true
  
  // MARK: - body
  var body: some View {
    
    HStack {
        VStack(alignment: .leading, spacing: 8) {
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
      
    } //: hstack
    
  }
}
