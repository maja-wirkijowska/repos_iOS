//
//  TaskDetailView.swift
//  Demo
//
//  Created by Maja Wirkijowska on 7/8/22.
//

import SwiftUI

struct TaskDetailView: View {
  // MARK: - props
  //var isUrgent: Bool
  @Environment(\.managedObjectContext) var viewContext
  @FetchRequest(
    sortDescriptors: [NSSortDescriptor(keyPath: \Item.timestamp, ascending: true)],
    animation: .default)
  var items: FetchedResults<Item>
  @ObservedObject var item: Item
  @State private var isCompleted: Bool = false

  
  
  // MARK: - body
  var body: some View {
    ZStack {
      
      VStack(alignment: .leading, spacing: 12) {
        // task name
        HStack {
          Text("Task: ").modifier(LeftTextModifier())
          Spacer()
          Text(item.name ?? "").modifier(RightTextModifier())
        }
        
        Divider().background(blueDark)
        
        // task description
        HStack {
          Spacer()
          VStack(alignment: .center, spacing: 8) {
            Text("Task Info: ")
              .foregroundColor(blueDark)
              .padding(.top, 6)
              .font(.headline)
            Text(item.info ?? "")
              .foregroundColor(blueDark)
              .font(.body)
              .padding()
              .multilineTextAlignment(.center)
          }
          Spacer()
        }
        Divider().background(blueDark)
        
        // task created
        HStack {
          Text("Date/Time Added: ").modifier(LeftTextModifier())
          Spacer()
          Text(dateFormatter.string(from: item.created ?? Date()))
            .modifier(RightTextModifier())
        }
        
        // due date
        HStack {
          Text("Date/Time Due: ").modifier(LeftTextModifier())
          Spacer()
          Text(dateFormatter.string(from: item.due ?? Date()))
            .modifier(RightTextModifier())
        }
        Divider().background(blueDark)
        
        // priority
        HStack {
          if (item.urgent) {
            Spacer()
            Text("URGENT").foregroundColor(myRed).font(.system(size: 20, weight: .bold))
            Image(systemName: "star.fill")
              .font(.system(size: 80))
              .foregroundColor(myRed)
            Text("URGENT").foregroundColor(myRed).font(.system(size: 20, weight: .bold))
            Spacer()
          } else if (item.longterm) {
            Spacer()
            Text("Long Term Goal").foregroundColor(myRed).font(.system(size: 20, weight: .bold))
            Spacer()
          } else if (item.normal) {
            Spacer()
            Text("Normal Priority").foregroundColor(myRed).font(.system(size: 20, weight: .bold))
            Spacer()
          }
        }
        Divider().background(blueDark)
        
        // mark complete
        HStack {
          Text("Mark Completed?").modifier(LeftTextModifier()).padding(.bottom, 10)
          Spacer()
          Toggle(isOn: $item.completed) {
          }
          .toggleStyle(CheckBoxStyleToggle())
          .padding()
          .onReceive(item.objectWillChange, perform: { _ in
            if self.viewContext.hasChanges {
              try? self.viewContext.save()
            }
          })
        }
      } //: vstack
      .background(item.completed ? myGreen : myYellow)
      .cornerRadius(10)
      .padding()
    }
    .modifier(BackgroundModifier())
  }
}

// MARK: - custom modifiers
struct LeftTextModifier: ViewModifier {
  func body(content: Content) -> some View {
    content
      .foregroundColor(blueDark)
      .padding(.top, 10)
      .padding(.leading, 10)
      .font(.headline)
  }
}

struct RightTextModifier: ViewModifier {
  func body(content: Content) -> some View {
    content
      .foregroundColor(blueDark)
      .padding(.top, 10)
      .padding(.trailing, 10)
      .font(.body)
  }
}

//struct TaskDetailView_Previews: PreviewProvider {
//  static var previews: some View {
//    TaskDetailView(item: item)
//  }
//}
