//
//  InfoView.swift
//  Slots
//
//  Created by Maja Wirkijowska on 7/14/22.
//

import SwiftUI

// MARK: - InfoView
struct InfoView: View {
  // MARK: - props
  @Environment(\.presentationMode) var presentationMode
  
  // MARK: - body
  var body: some View {
    VStack(alignment: .center, spacing: 10) {
      LogoView()
      Spacer()
      
      Form {
        Section(header: Text("About Slot Machine")) {
          FormRowView(firstItem: "Application", secondItem: "Slot Machine")
          FormRowView(firstItem: "Platforms", secondItem: "iPhone, iPad, Mac")
          FormRowView(firstItem: "Developer", secondItem: "Maja")
          FormRowView(firstItem: "Desiger", secondItem: "Robart Petras")
          FormRowView(firstItem: "Music", secondItem: "Dan Lebowitz")
          FormRowView(firstItem: "Website", secondItem: "swiftuimasterclass.com")
          FormRowView(firstItem: "Copyright", secondItem: "2022")
          FormRowView(firstItem: "Version", secondItem: "1.0.0")
          
        } //: section - header
      } //: form
      .font(.system(.body, design: .rounded))
      
    } //: vstack - main container
    .padding(.top, 40)
    .overlay(
      // needed for mac version of app, iOS lets user slide down to dismiss sheet
      Button(action: {
        audioPlayer?.stop()
        self.presentationMode.wrappedValue.dismiss()
      }, label: {
        Image(systemName: "xmark.circle")
          .font(.title)
      })
      .padding(.top, 30)
      .padding(.trailing, 20)
      .accentColor(.secondary)
      , alignment: .topTrailing
    ) //: overlay - button
    .onAppear(perform: {
      playSound(sound: "background-music", type: "mp3")
    })
  }
}

// MARK: - FormRowView
struct FormRowView: View {
  var firstItem: String
  var secondItem: String
  
  var body: some View {
    HStack {
      Text(firstItem).foregroundColor(.gray)
      Spacer()
      Text(secondItem)
    }
  }
}

// MARK: - preview
struct InfoView_Previews: PreviewProvider {
  static var previews: some View {
    InfoView()
  }
}


