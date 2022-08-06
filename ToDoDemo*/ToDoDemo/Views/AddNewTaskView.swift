//
//  AddTaskView.swift
//  Demo
//
//  Created by Maja Wirkijowska on 7/8/22.
//

import SwiftUI

struct AddNewTaskView: View {
  // MARK: - props
  @Environment(\.managedObjectContext) private var viewContext
  @Environment(\.presentationMode) var presentationMode
  @State var taskName: String = ""
  @State var taskInfo: String = ""
  @State var isUrgent: Bool = false
  @State var isRegular: Bool = false
  @State var isLongTerm: Bool = false
  @State var isCompleted: Bool = false
  @State var selectedDate = Date()
  var isButtonDisabled: Bool { taskName.isEmpty }
  let dateTime: Date = Date()
  
  var category: String {
    if (isUrgent) { return "urgent" }
    else if (isRegular) { return "normal" }
    else if (isLongTerm) { return "longterm" }
    else { return "all" }
  }

  
  
  // MARK: - functions
  private func addTask() {
    if (!isButtonDisabled) {
      withAnimation {
        let newTask = Item(context: viewContext)
        newTask.id = UUID()
        newTask.name = taskName
        newTask.info = taskInfo
        newTask.urgent = isUrgent
        newTask.due = selectedDate
        newTask.normal = isRegular
        newTask.longterm = isLongTerm
        newTask.category = category
        
        do {
          try viewContext.save()
        } catch {
          let nsError = error as NSError
          fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
        }
        
        taskName = ""
        taskInfo = ""
        selectedDate = Date()
        isUrgent = false
        isRegular = false
        isLongTerm = false
      }
    }
  }
  
  
  // MARK: - body
  var body: some View {
    VStack {      
      Spacer()
      // today's date
      Text("Current Date:")
        .foregroundColor(veryLight)
        .font(.title)
        .fontWeight(.semibold)
        .padding(.vertical, 10)
      Text((dateFormatter.string(from: dateTime)))
        .foregroundColor(veryLight)
        .font(.title)
        .fontWeight(.semibold)
      Spacer()
      
      VStack(spacing: 16) {
        
        Text("Add New Task")
          .font(.title)
          .fontWeight(.semibold)
          .foregroundColor(blueDark)
          .shadow(color: .gray, radius: 4, x: 0, y: 4)
          
        
        // task name
        TextField("Task Name*", text: $taskName)
          .font(.system(size: 24, weight: .bold, design: .rounded))
          .modifier(TextFieldModifier())
          
        // task info
        TextField("Task Info", text:  $taskInfo)
          .font(.system(size: 16, weight: .heavy, design: .rounded))
          .modifier(TextFieldModifier())
        
        // select date time
        DatePicker("Select", selection: $selectedDate)
          .datePickerStyle(CompactDatePickerStyle())
          .foregroundColor(blueDark)
          .cornerRadius(4)
          .padding(.vertical, 6)
        
        // is urgent?
        VStack {
          HStack {
            Spacer()
            Text("Select Priority")
              .foregroundColor(blueDark)
            Spacer()
          }
          HStack {
            VStack {
              Toggle(isOn: $isUrgent, label: {
                Text("Urgent")
              })
              .toggleStyle(CheckBoxSmallStyleToggle())
              .foregroundColor(isUrgent ? priorityUrgent : blueDark)
              Text("Urgent")
                .foregroundColor(blueDark)
                .font(.subheadline)
            }
            .frame(width: 100, height: 50, alignment: .center)
            
            Spacer()
            
            VStack {
              Toggle(isOn: $isRegular, label: {
                Text("Normal")
              })
              .toggleStyle(CheckBoxSmallStyleToggle())
              .foregroundColor(isRegular ? priorityNormal : blueDark)
              Text("Normal")
                .foregroundColor(blueDark)
                .font(.subheadline)
            }
            .frame(width: 100, height: 50, alignment: .center)
            
            Spacer()
            
            VStack {
              Toggle(isOn: $isLongTerm, label: {
                Text("Long Term")
              })
              .toggleStyle(CheckBoxSmallStyleToggle())
              .foregroundColor(isLongTerm ? priorityLongterm : blueDark)
              Text("Long Term")
                .foregroundColor(blueDark)
                .font(.subheadline)
            }
            .frame(width: 100, height: 50, alignment: .center)
            
          }
        }
        
        // save button
        Button(action: {
          addTask()
          self.presentationMode.wrappedValue.dismiss()
        }, label: {
          Text("SAVE")
            .font(.title3)
            .fontWeight(.semibold)
            .foregroundColor(blueDark)
            .padding(.horizontal, 30)
        })
        .frame(width: 300, height: 60)
        .background(
            Capsule()
              .foregroundColor(isButtonDisabled ? .gray : myYellow)
              .shadow(color: .black, radius: 8, x: 8, y: 8  )
        )
        .padding()
        
        Text("*Required field")
          .foregroundColor(blueDark)
          .font(.caption)
        
      } //: vstack
      .padding()
      .background(veryLight)
      .cornerRadius(16)
    }
    .padding(.horizontal)
    .padding(.bottom, 30)
    .modifier(BackgroundModifier())
    
  } //: body
}

// MARK: - custom modifier
struct TextFieldModifier: ViewModifier {
  func body(content: Content) -> some View {
    content
      .padding()
      .background(textFieldColor)
      .foregroundColor(blueDark)
      .cornerRadius(10)
  }
}

// MARK: - preview
struct AddTaskView_Previews: PreviewProvider {
  static var previews: some View {
    AddNewTaskView()
      //.padding()
      .background().ignoresSafeArea(.all)
  }
}
