//
//  AddTodoItemView.swift
//  MCToDo
//
//  Created by Maja Wirkijowska on 7/15/22.
//

import SwiftUI

struct AddTodoItemView: View {
  // MARK: - props
  @Environment(\.managedObjectContext) var managedObjectContext
  @Environment(\.presentationMode) var presentationMode
  @State private var name: String = ""
  @State private var priority: String = "Normal"
  @State private var errorShowing: Bool = false
  @State private var errorTitle: String = ""
  @State private var errorMessage: String = ""
  
  let priorities = ["High", "Normal", "Low"]
  
  // MARK: - body
  var body: some View {
    
    NavigationView {
    
      VStack {
        VStack(alignment: .leading, spacing: 20) {

          // MARK: - to do name
          TextField("Task Name", text: $name)
            .padding()
            .background(Color(UIColor.tertiarySystemFill))
            .cornerRadius(9)
            .font(.system(size: 24, weight: .bold, design: .default))
          
          // MARK: - priority
          Picker("Priority", selection: $priority) {
            ForEach(priorities, id: \.self) {
              Text($0)
            }
          } //: picker -
          .pickerStyle(SegmentedPickerStyle())
          
          // MARK: - save
          Button(action: {
            if (self.name != "") {
              let todo = Todo(context: self.managedObjectContext)
              todo.name = self.name
              todo.priority = self.priority
              
              do {
                try self.managedObjectContext.save()
                //print("New Todo item: \(todo.name ?? ""), Priority: \(todo.priority ?? "")")
              } catch {
                print(error)
              }
            } else {
              self.errorShowing = true
              self.errorTitle = "No Task Name"
              self.errorMessage = "Task name field is required"
              return
            } //: conditional -
            self.presentationMode.wrappedValue.dismiss()
          }, label: {
            Text("save".uppercased())
              .font(.system(size: 24, weight: .bold, design: .default))
              .padding()
              .frame(minWidth: 0, maxWidth: .infinity)
              .background(.blue)
              .cornerRadius(9)
              .foregroundColor(.white)
          }) //: save button -
          
          
        } //: vstack
        .padding(.horizontal)
        .padding(.vertical, 30)
        
        Spacer()
      } //: vstack - inside nav view
      .navigationBarTitle("New Task", displayMode: .inline)
      .toolbar(content: {
        ToolbarItem(content: {
          Button(action: {
            self.presentationMode.wrappedValue.dismiss()
          }, label: {
            Image(systemName: "xmark").foregroundColor(.blue)
          })
        }) //: toolbaritem - close
      }) //: toolbar() -
      .alert(isPresented: $errorShowing) {
        Alert(title: Text(errorTitle), message: Text(errorMessage), dismissButton: .default(Text("OK")))
      }
      
    } //: nav view
  } //: body
} //: struct -


// MARK: - preview
struct AddTodoItemView_Previews: PreviewProvider {
  static var previews: some View {
    AddTodoItemView()
  }
}
