//
//  ContentView.swift
//  Notes WatchKit Extension
//
//  Created by Maja Wirkijowska on 7/5/22.
//

import SwiftUI

struct ContentView: View {
  // MARK: - props
  @State private var notes: [Note] = [Note]()
  @State private var text: String = ""
  @AppStorage("lineCount") var lineCount: Int = 1
  
  // MARK: - functions
  func save() {
    //dump(notes)
    
    do {
      // 1. convert notes array to data using JSONEncoder
      let data = try JSONEncoder().encode(notes)
      
      // 2. create new URL to save the file using getDocumnetDirectory()
      let url = getDocumentDirectory().appendingPathComponent("notes")
      
      // 3. write data to the given URL
      try data.write(to: url)
      
    } catch {
      print("saving data failed")
    }
  }
  
  func load() {
    DispatchQueue.main.async {
      do {
        // 1. get url path
        let url = getDocumentDirectory().appendingPathComponent("notes")
        
        // 2. create new prop for data
        let data = try Data(contentsOf: url)
        
        // 3. decode data
        notes = try JSONDecoder().decode([Note].self, from: data)
        
      } catch {
        // do nothing
      } //: do-catch
    } //: dispatch queue
  }
  
  func delete(offsets: IndexSet) {
    withAnimation {
      notes.remove(atOffsets: offsets)
      save()
    }
  }
  
  func getDocumentDirectory() -> URL {
    let path = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
    return path[0]
  }
  
  // MARK: - body
  var body: some View {
    
    VStack {
      
      HStack(alignment: .center, spacing: 6) {
        
        TextField("Add New Note", text: $text)
        
        Button {
          // 1. only allow action when text field is not empty
          guard text.isEmpty == false else { return }
          
          // 2. create new item and initialize with text value
          let note = Note(id: UUID(), text: text)
          
          // 3. add new note to notes array with append()
          notes.append(note)
          
          // 4. make text field empty
          text = ""
          
          // 5. save the note using a function
          save()
          
        } label: {
          Image(systemName: "plus.circle")
            .font(.system(size: 42, weight: .semibold))
        }
        .fixedSize()
        .buttonStyle(PlainButtonStyle())
        .foregroundColor(.accentColor)
        //.buttonStyle(BorderedButtonStyle(tint: .accentColor))
        //: plus button
        
      } //: hstack
      
      Spacer()
      
      if (notes.count >= 1) {
        List {
          ForEach(0 ..< notes.count, id: \.self) { i in
            NavigationLink(destination: DetailView(note: notes[i], count: notes.count, index: i)) {
              HStack {
                Capsule()
                  .frame(width: 4)
                  .foregroundColor(.accentColor)
                Text(notes[i].text)
                  .lineLimit(lineCount)
                  .padding(.leading, 5)
              } //: hstack
            } //: nav link
          } //: loop
          .onDelete(perform: delete)
        } //: list
      } else {
        Spacer()
        Image(systemName: "note.text")
          .resizable()
          .scaledToFit()
          .foregroundColor(.gray)
          .opacity(0.25)
          .padding(25)
        Spacer()
      } //: conditional
      
    }//: vstack
    .navigationTitle("Notes") // shows up in simulator but not preview
    .onAppear(perform: {
      load()
    })
    
  } //: body
}

// MARK: - preview
struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView()
  }
}
