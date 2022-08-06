//
//  ContentView.swift
//  Devote
//
//  Created by Maja Wirkijowska on 7/1/22.
//

import SwiftUI
import CoreData

struct ContentView: View {
  // MARK: - props
  /*  fetching data
      .managedObjectContext is already injected, we can manipulate Core Data objects entirely in RAM
   */
  @Environment(\.managedObjectContext) private var viewContext
  @State var task: String = ""
  @State private var showNewTaskItem: Bool = false
  @AppStorage("isDarkMode") private var isDarkMode: Bool = false
  
  // Fetch Requests allow us to load core data results that match the specified criteria and SwiftUI can bind those results directly to UI elements
  @FetchRequest(
    sortDescriptors: [NSSortDescriptor(keyPath: \Item.timestamp, ascending: true)],
    animation: .default)
  private var items: FetchedResults<Item>
  
  // MARK: - functions
  
  
  private func deleteItems(offsets: IndexSet) {
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
  
  // MARK: - body
  var body: some View {
    NavigationView {
      ZStack {
        // MARK: - main view
        
        VStack {
          // MARK: - header
          HStack(spacing: 10) {
            
            // title
            Text("Devote")
              .font(.system(.largeTitle, design: .rounded))
              .fontWeight(.heavy)
              .padding(.leading, 4)
            
            Spacer()
            
            // edit button
            EditButton()
              .font(.system(size: 16, weight: .semibold, design: .rounded))
              .padding(.horizontal, 10)
              .frame(minWidth: 70, minHeight: 24)
              .background(Capsule().stroke(Color.white, lineWidth: 2))
            
            // appearance button
            Button(action: {
              // toggle appearance
              isDarkMode.toggle()
              playSound(sound: "sound-tap", type: "mp3")
              feedback.notificationOccurred(.success)
            }, label: {
              Image(systemName: isDarkMode ? "moon.circle.fill" : "moon.circle")
                .resizable()
                .frame(width: 24, height: 24)
                .font(.system(.title, design: .rounded))
            })
            
          } //: hstack
          .padding()
          .foregroundColor(.white)
          
          Spacer(minLength: 80)
          
          // MARK: - new task button
          Button(action: {
            showNewTaskItem = true
            playSound(sound: "sound-ding", type: "mp3")
            feedback.notificationOccurred(.success)
          }, label: {
            Image(systemName: "plus.circle")
              .font(.system(size: 30, weight:  .semibold, design: .rounded))
            Text("New Task")
              .font(.system(size: 24, weight: .bold, design: .rounded))
          })
          .foregroundColor(.white)
          .padding(.horizontal, 20)
          .padding(.vertical, 15)
          .background(backgroundGradient.clipShape(Capsule()))
          .shadow(color: Color(red: 0, green: 0, blue: 0, opacity: 0.25), radius: 8, x: 0.0, y: 4.0)
          
          // MARK: - tasks
          List {
            ForEach(items) { item in
              
              ListRowItemView(item: item)
              
            } //: loop
            .onDelete(perform: deleteItems)
            
          } //: list
          .listStyle(InsetGroupedListStyle())
          .shadow(color: Color(red: 0, green: 0, blue: 0, opacity: 0.3), radius: 12)
          .padding(.vertical, 0)
          .frame(maxWidth: 640) // optimization for iPads
        } //: vstack
        .blur(radius: showNewTaskItem ? 8.0 : 0.0, opaque: false)
        .transition(.move(edge: .bottom))
        .animation(.easeOut(duration: 0.5), value: showNewTaskItem)
        
        
        // MARK: - new task item
        if (showNewTaskItem) {
          BlankView(
            backgroundColor: isDarkMode ? Color.black : Color.gray,
            backgroundOpacity: isDarkMode ? 0.3 : 0.5)
            .onTapGesture {
              withAnimation() {
                showNewTaskItem = false
              }
            }
          NewTaskItemView(isShowing: $showNewTaskItem)
        }
        
      } //: zstack
      .onAppear() {
        UITableView.appearance().backgroundColor = UIColor.clear
      }
      .navigationBarTitle("Daily Tasks", displayMode: .large)
      .navigationBarHidden(true)
      .background(BackgroundImageView().blur(radius: showNewTaskItem ? 8.0 : 0, opaque: false))
      .background(backgroundGradient.ignoresSafeArea(.all))
    } //: nav view
    .navigationViewStyle(StackNavigationViewStyle())
  } //:  body
  
}

// MARK: - preview
struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
      .previewDevice("iPhone 13")
  }
}
