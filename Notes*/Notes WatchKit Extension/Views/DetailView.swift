//
//  DetailView.swift
//  Notes WatchKit Extension
//
//  Created by Maja Wirkijowska on 7/6/22.
//

import SwiftUI

struct DetailView: View {
  // MARK: - props
  let note: Note
  let count: Int
  let index: Int
  @State private var isCreditsPresented: Bool = false
  @State private var isSettingsPresented: Bool = false
  
  // MARK: - body
  var body: some View {
    
    VStack(alignment: .center, spacing: 3) {
      
      // header
      HeaderView(title: "")
      
      // content
      Spacer()
      ScrollView(.vertical) {
        Text(note.text)
          .font(.title3)
          .fontWeight(.semibold)
          .multilineTextAlignment(.center)
      }
      Spacer()
      
      // footer
      HStack(alignment: .center) {
        
        Image(systemName: "gear")
          .imageScale(.large)
          .onTapGesture {
            isSettingsPresented.toggle()
          }
          .sheet(isPresented: $isSettingsPresented, content: {
            SettingsView()
          })
        
        Spacer()
        Text("\(index + 1) / \(count)")
        Spacer()
        Image(systemName: "info.circle")
          .imageScale(.large)
          .onTapGesture {
            isCreditsPresented.toggle()
          }
          .sheet(isPresented: $isCreditsPresented, content: {
            CreditsView()
          }) // includes built-in cancel button
        
      } //: hstack
      .foregroundColor(.secondary)
      
    } //: vstack
    .padding(3)
    
  } //: body
} //: struct

// MARK: - preview
struct DetailView_Previews: PreviewProvider {
  static var sampleData: Note = Note(id: UUID(), text: "HelloWorld")
  static var previews: some View {
    DetailView(note: sampleData, count: 5, index: 1)
  }
}
