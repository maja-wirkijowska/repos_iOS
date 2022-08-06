//
//  ContentView.swift
//  ToDoDemo
//
//  Created by Maja Wirkijowska on 7/11/22.
//

import SwiftUI
import CoreData

struct ToDoListView: View {
  // MARK: - props
  @Environment(\.managedObjectContext) private var viewContext
  @FetchRequest(
    sortDescriptors: [NSSortDescriptor(keyPath: \Item.timestamp, ascending: true)],
    animation: .default)
  private var items: FetchedResults<Item>
  @State private var showCompletedOnly: Bool = false
  @State private var showInProgressOnly: Bool = false
  @State private var filter = FilterCategory.all
  @State private var selectedTask: Item?
  @State private var showingNewTaskView: Bool = false
  
  var title: String {
    let title = filter == .all ? "All Tasks" : filter.rawValue
    
    if (showCompletedOnly) { return "\(title) Completed" }
    else if (showInProgressOnly) { return "\(title) To Do"}
    else { return title }
  }
  
  var index: Int? {
    items.firstIndex(where: { $0.id == selectedTask?.id })
  }
  
  var filterCompleted: [Item] {
    items.filter { item in
      (!showInProgressOnly || item.completed) && (filter == .all || filter.rawValue == item.category)
    }
  }
  
  var filterToDo: [Item] {
    items.filter { item in
      (!showCompletedOnly || item.completed && (filter == .all || filter.rawValue == item.category))
    }
  }
  
  enum FilterCategory: String, CaseIterable, Identifiable {
    case all = "All"
    case urgent = "Urgent"
    case normal = "Normal"
    case longTerm = "Long Term"
    var id: FilterCategory { self }
  }

  
  // MARK: - functions
  private func selectListRowBackground(item: Item) -> Color {
    if (item.urgent) { return priorityUrgent }
    else if (item.normal) {return priorityNormal }
    else if (item.longterm) { return priorityLongterm }
    return myYellow
  }
  
  // MARK: - body
  var body: some View {
    VStack {
      List(selection: $selectedTask) {
        ForEach(items) { item in
          NavigationLink(
            destination: TaskDetailView(item: item),
            label: {
              TaskItemView(item: item)
            })
          .tag(item)
          .listRowBackground(selectListRowBackground(item: item))
        }
        .onDelete(perform: deleteItems)
             
      } //: LIST
      .listStyle(InsetListStyle())
      .navigationTitle(title)
      .navigationBarTitleDisplayMode(.inline)
      .background(LinearGradient(gradient: backgroundGradient, startPoint: .top, endPoint: .bottom))
      
      // MARK: - toolbar
      .toolbar {
        
        ToolbarItem(placement: .navigationBarTrailing) {
          Button(action: {
            self.showingNewTaskView = true
          }, label: {
            Image(systemName: "plus")
          })
        }
        
        ToolbarItem(placement: .navigationBarTrailing) {
          Menu {
            Picker("Category", selection: $filter) {
              ForEach(FilterCategory.allCases) { item in
                Text(item.rawValue).tag(item)
              }
            }
            .pickerStyle(.inline)
            
            Toggle(isOn: $showCompletedOnly) {
              Label("Completed", systemImage: "checkmark.circle")
            }
            Toggle(isOn: $showInProgressOnly) {
              Label("To Do", systemImage: "circle")
            }
          } label: {
            Label("Filter", systemImage: "slider.horizontal.3")
          }
        }
      } //: .toolbar
    } //: vstack
    .sheet(isPresented: $showingNewTaskView, content: { AddNewTaskView() })
    //.focusedValue(\.selectedTask, items[index ?? 0])

  }
  
  func addItem() {
    withAnimation {
      let newItem = Item(context: viewContext)
      newItem.timestamp = Date()
      
      do {
        try viewContext.save()
      } catch {
        let nsError = error as NSError
        fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
      }
    }
  }
  
  func deleteItems(offsets: IndexSet) {
    withAnimation {
      offsets.map { items[$0] }.forEach(viewContext.delete)
      
      do {
        try viewContext.save()
      } catch {
        let nsError = error as NSError
        fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
      }
    }
  }
}



struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ToDoListView()
      .environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
  }
}
