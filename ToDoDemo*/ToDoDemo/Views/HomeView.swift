//
//  HomeView.swift
//  ToDoDemo
//
//  Created by Maja Wirkijowska on 7/11/22.
//

import SwiftUI

struct HomeView: View {
  // MARK: - props
  @Environment(\.managedObjectContext) var viewContext
  @FetchRequest(
    sortDescriptors: [NSSortDescriptor(keyPath: \Item.timestamp, ascending: true)],
    animation: .default)
  var items: FetchedResults<Item>
  @State var showNewTaskItemView: Bool = false
  @State var showingInfoView: Bool = false

  
  // MARK: - body
  var body: some View {
    NavigationView {
      ZStack {
        
        VStack {
          // MARK: - header
          HeaderComponent()
            .offset(y: -60)
            .navigationTitle("Home")
          
          // MARK: - add new task
//          NavigationLink(destination: AddNewTaskView(), label: {
//            Text(newTaskButton)
//              .modifier(ButtonModifier())
//          })
          Button(action: {
            self.showNewTaskItemView = true
          }, label: {
            Text(newTaskButton)
              .modifier(ButtonModifier())
          })
          
          // MARK: - view to do list
          NavigationLink(destination: ToDoListView(), label: {
            Text(viewAllTasksButton)
              .modifier(ButtonModifier())
          })
          
          // MARK: - completed list
          NavigationLink(destination: CompletedListView(), label: {
            Text(viewCompletedTasksButton)
              .modifier(ButtonModifier())
          })
 
        } //: vstack
        .navigationBarHidden(true)
        

        
      } //: zstack
      .modifier(BackgroundModifier())
      .overlay(
        // info
        Button(action: {
          self.showingInfoView = true
        }, label: {
          Image(systemName: "info.circle")
        })
        .font(.title)
        .accentColor(veryLight)
        .padding(.trailing, 20)
        .padding(.bottom, 10)
        , alignment: .bottomTrailing
      )
      
    
    } //: nav view
    .navigationViewStyle(StackNavigationViewStyle())
    .accentColor(blueDark)
    .sheet(isPresented: $showingInfoView, content: { InfoView() })
    .sheet(isPresented: $showNewTaskItemView, content: { AddNewTaskView() })
    
    
  } //: body
} //: struct



// MARK: - preview
struct HomeView_Previews: PreviewProvider {
  static var previews: some View {
    HomeView()
  }
}
