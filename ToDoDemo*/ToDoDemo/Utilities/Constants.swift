//
//  Constants.swift
//  ToDoDemo
//
//  Created by Maja Wirkijowska on 7/11/22.
//

import SwiftUI

// MARK: - COLORS
let blueDark: Color = Color("blueDark")
let blueLight: Color = Color("blueLight")
let myGreen: Color = Color("myGreen")
let myYellow: Color = Color("myYellow")
let veryLight: Color = Color("veryLight")
let myRed: Color = Color("myRed")
let textFieldColor: Color = Color("textFieldColor")
let priorityUrgent: Color = Color("priorityUrgent")
let priorityNormal: Color = Color("priorityNormal")
let priorityLongterm: Color = Color("priorityLongTerm")

// MARK: - gradient
let backgroundGradient: Gradient = Gradient(colors: [blueLight, blueDark])

// MARK: - SYMBOL NAMES
let exclamationMark = "exclamationmark.3"

// MARK: - button labels
let newTaskButton: String = "Add New Task"
let newTaskImage: String = "plus.circle.fill"
let viewAllTasksButton: String = "View Tasks"
let viewListImage: String = "list.bullet.rectangle.fill"
let viewCompletedTasksButton: String = "View Completed"
let viewCimpletedImage: String = "checkmark.rectangle.portrait.fill"

// MARK: - STRINGS
let appTitle: String = "To Do Demo App"

// MARK: - FORMATTERS
var dateFormatter: DateFormatter {
  let formatter = DateFormatter()
  formatter.dateStyle = .short
  //formatter.timeStyle = .short
  return formatter
}

// MARK: - button modifier
struct ButtonModifier: ViewModifier {
  func body(content: Content) -> some View {
    content
      .font(.system(.title3) .weight(.bold))
      .foregroundColor(blueDark)
      .frame(width: 300, height: 60)
      .background(
        Capsule()
          .foregroundColor(myYellow)
          .shadow(color: .black, radius: 8, x: 8, y: 8)
      )
      .padding()
  }
}

// MARK: - background modifier
struct BackgroundModifier: ViewModifier {
  func body(content: Content) -> some View {
    content
      .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity, alignment: .center)
      .background(LinearGradient(gradient: backgroundGradient, startPoint: .top, endPoint: .bottom))
      //.edgesIgnoringSafeArea(.all)
  }
}


