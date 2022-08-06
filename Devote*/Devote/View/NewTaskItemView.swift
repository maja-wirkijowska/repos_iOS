//
//  NewTaskItemView.swift
//  Devote
//
//  Created by Maja Wirkijowska on 7/5/22.
//

import SwiftUI

struct NewTaskItemView: View {
  // MARK: - props
  @Environment(\.managedObjectContext) private var viewContext
  private var isButtonDisabled: Bool {
    task.isEmpty
  }
  @State private var task: String = ""
  @Binding var isShowing: Bool
  @AppStorage("isDarkMode") private var isDarkMode: Bool = false
  
  // MARK: - functions
  private func addItem() {
    withAnimation {
      let newItem = Item(context: viewContext)
      newItem.timestamp = Date()
      newItem.task = task
      newItem.completion = false
      newItem.id = UUID()
      
      do {
        try viewContext.save()
      } catch {
        
        let nsError = error as NSError
        fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
      }
      
      task = ""
      hideKeyboard()
      isShowing = false
    }
  }
  
  // MARK: - body
  var body: some View {
    
    VStack {
      Spacer()
      VStack(spacing: 16) {
        TextField("New Task", text: $task)
          .foregroundColor(.pink)
          .font(.system(size: 24, weight: .bold, design: .rounded))
          .padding()
          .background(isDarkMode ? Color(UIColor.tertiarySystemGroupedBackground) : Color(UIColor.secondarySystemBackground))
          .cornerRadius(10)
        
        Button(action: {
          addItem()
          playSound(sound: "sound-ding", type: "mp3")
          feedback.notificationOccurred(.success)
        }, label: {
          Spacer()
          Text("SAVE")
            .font(.system(size: 24, weight: .bold, design: .rounded))
          Spacer()
        })
        .disabled(isButtonDisabled)
        .onTapGesture {
          if (isButtonDisabled) {
            playSound(sound: "sound-tap", type: "mp3")
          }
        }
        .padding()
        .foregroundColor(.white)
        .background(isButtonDisabled ? .blue : .pink)
        .cornerRadius(10)
        
      } //: vstack
      .padding(.horizontal)
      .padding(.vertical, 20)
      .background(isDarkMode ? Color(UIColor.secondarySystemBackground) : Color.white)
      .cornerRadius(16)
      .shadow(color: Color(red: 0, green: 0, blue: 0, opacity: 0.65), radius: 24)
      .frame(maxWidth: 640)
    } //: vstack
    .padding()
    
  } //: body
}

// MARK: - preview
struct NewTaskItemView_Previews: PreviewProvider {
  static var previews: some View {
    NewTaskItemView(isShowing: .constant(true))
      .previewDevice("iPhone 13")
      .background(Color.gray.edgesIgnoringSafeArea(.all))
  }
}
