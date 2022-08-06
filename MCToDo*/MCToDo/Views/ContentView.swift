//
//  ContentView.swift
//  MCToDo
//
//  Created by Maja Wirkijowska on 7/15/22.
//

import SwiftUI
import CoreData

struct ContentView: View {
  // MARK: - props
  @EnvironmentObject var iconSettings: IconNames
  @Environment(\.managedObjectContext) var managedObjectContext
  @FetchRequest(entity: Todo.entity(), sortDescriptors: [NSSortDescriptor(keyPath: \Todo.name, ascending: true)]) var todos: FetchedResults<Todo>
  @State private var showingAddTodoView: Bool = false
  @State private var addButtonIsAnimated: Bool = false
  @State private var showingSettingsView: Bool = false

  
  // MARK: - body
  var body: some View {
    
    NavigationView {
      
      ZStack {
        List {
          ForEach(self.todos, id: \.self) { todo in
            HStack{
              Text(todo.name ?? "Unknown")
              Spacer()
              Text(todo.priority ?? "Unknown")
            }
          } //: foreach
          .onDelete(perform: deleteTodo)
        } //: list -
        .navigationBarTitle("To Do List", displayMode: .inline)
        .navigationBarItems(
          leading: EditButton(),
          trailing:
            Button(action: {
              self.showingSettingsView.toggle()
            }) {
              Image(systemName: "paintbrush")
            })
        .sheet(isPresented: $showingSettingsView, content: {
          SettingsView()
            .environmentObject(self.iconSettings)
            .environment(\.managedObjectContext, self.managedObjectContext)
        })
        
        // MARK: - no todo items
        if (todos.count == 0) {
          EmptyListView()
        }
        
      } //: ztack
      .sheet(isPresented: $showingAddTodoView, content: {
        AddTodoItemView().environment(\.managedObjectContext, self.managedObjectContext)
      })
      .overlay(
        ZStack {
          
          Group {
            Circle()
              .fill(.blue)
              .opacity(self.addButtonIsAnimated ? 0.2 : 0)
              .scaleEffect(self.addButtonIsAnimated ? 1 : 0)
              .frame(width: 68, height: 68, alignment: .center)
            Circle()
              .fill(.blue)
              .opacity(self.addButtonIsAnimated ? 0.15 : 0)
              .scaleEffect(self.addButtonIsAnimated ? 1 : 0)
              .frame(width: 88, height: 88, alignment: .center)
          }
          //.animation(Animation.easeInOut(duration: 2).repeatForever(autoreverses: true), value: self.addButtonIsAnimated)
          
          Button(action: {
            self.showingAddTodoView.toggle()
          }) {
            Image(systemName: "plus.circle.fill")
              .resizable()
              .scaledToFit()
              .background(Circle().fill(Color("ColorBase")))
              .frame(width: 48, height: 48, alignment: .center)
          }
          .onAppear(perform: {
            self.addButtonIsAnimated.toggle()
          })
          
        } //: zstack - with button
          .padding(.bottom, 15)
          .padding(.trailing, 15)
        , alignment: .bottomTrailing
      )
      
    } //: nav view -
    
  } //: body -
  
  // MARK: - funcs
  private func deleteTodo(at offsets: IndexSet) {
    for index in offsets {
      let todo = todos[index]
      managedObjectContext.delete(todo)
      do {
        try managedObjectContext.save()
      } catch {
        print(error)
      }
    }
  } //: deleteTodo()
  
} //: struct -



// MARK: - preview
struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
  }
}
