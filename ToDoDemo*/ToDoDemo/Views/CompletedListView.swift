//
//  CompletedListView.swift
//  ToDoDemo
//
//  Created by Maja Wirkijowska on 7/12/22.
//

import SwiftUI

struct CompletedListView: View {
  // MARK: - props
  @Environment(\.managedObjectContext) private var viewContext
  @FetchRequest(
    sortDescriptors: [NSSortDescriptor(keyPath: \Item.timestamp, ascending: true)],
    animation: .default)
  private var items: FetchedResults<Item>
  
  // MARK: - body
  var body: some View {
    VStack {
      List {
        ForEach(items) { item in
          if (item.completed) {
            NavigationLink(destination: TaskDetailView(item: item), label: {
              TaskCompletedView(item: item)
            })
            .listRowBackground(item.completed ? myGreen : myYellow)
          } //: if
        } //: loop
        .onDelete(perform: deleteItems)
        
      } //: list
      .listStyle(InsetListStyle())
      .navigationTitle("Completed Tasks")
      .navigationBarTitleDisplayMode(.inline)
      .background(LinearGradient(gradient: backgroundGradient, startPoint: .top, endPoint: .bottom))
      
      // MARK: - toolbar
      .toolbar {
        ToolbarItem(placement: .navigationBarTrailing) {
          EditButton()
            .accentColor(blueDark)
        } //: toolbar edit
      } //: .toolbar
    } //: vstack
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

struct CompletedListView_Previews: PreviewProvider {
  static var previews: some View {
    CompletedListView()
  }
}
