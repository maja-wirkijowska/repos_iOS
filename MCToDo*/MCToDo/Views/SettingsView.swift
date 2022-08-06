//
//  SettingsView.swift
//  MCToDo
//
//  Created by Maja Wirkijowska on 7/15/22.
//

import SwiftUI

struct SettingsView: View {
  // MARK: - props
  @Environment(\.presentationMode) var presentationMode
  @EnvironmentObject var iconSettings: IconNames
  
  // MARK: - body
  var body: some View {
    
    NavigationView {
      
      VStack(alignment: .center, spacing: 0) {
        
        // MARK: - form
        Form {
          
          // MARK: - section 1
          Section(header: Text("Choose App Icon").padding(.top, 6)) {
            Picker(selection: $iconSettings.currentIndex, label:
                    
            HStack {
              ZStack {
                RoundedRectangle(cornerRadius: 8, style: .continuous)
                  .stroke(Color.primary, lineWidth: 2)
                
                Image(systemName: "paintbrush")
                  .font(.system(size: 28, weight: .regular, design: .default))
                  .foregroundColor(Color.primary)
              }
              .frame(width: 44, height: 44)
              
              Text("App Icons".uppercased())
                .fontWeight(.bold)
                .foregroundColor(Color.primary)
            } //: hstack - label
                   
            ) {
              ForEach(0 ..< iconSettings.iconNames.count, id: \.self) { index in
                HStack {
                  Image(uiImage: UIImage(named: self.iconSettings.iconNames[index] ?? "Blue") ?? UIImage())
                    .renderingMode(.original)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 44, height: 44)
                    .cornerRadius(8)
                  
                  Spacer().frame(width: 8)
                  
                  Text(self.iconSettings.iconNames[index] ?? "Blue")
                    //.frame(width: 8)
                  
                } //: hstack -
                .padding(3)
              } //: loop -
            } //: picker -
            .onReceive([self.iconSettings.currentIndex].publisher.first()) {
              (value) in
              let index = self.iconSettings.iconNames.firstIndex(of: UIApplication.shared.alternateIconName) ?? 0
              if index != value {
                UIApplication.shared.setAlternateIconName(self.iconSettings.iconNames[value]) { error in
                  if let error = error {
                    print(error.localizedDescription)
                  } else {
                    print("App Icon Changed Successfully!!")
                  }
                }
              }
            } //: onReceive() - 
          } //: section one - choose app icon
          
          
          // MARK: - section 2
          
          // MARK: - section 3
          Section(header: Text("Follow us on Social Media"), content: {
            FormRowLinkView(icon: "globe", color: .pink, text: "Website", link: website)
            FormRowLinkView(icon: "link", color: .blue, text: "Twitter", link: twitter)
            FormRowLinkView(icon: "play.rectangle", color: .green, text: "Courses", link: courses)
          })
          
          // MARK: - section 4
          Section(header: Text("About ToDo"), content: {
            FormRowStaticView(icon: "gear", left: "Application", right: "To Do")
            FormRowStaticView(icon: "checkmark.seal", left: "Compatability", right: "iPhone/iPad")
            FormRowStaticView(icon: "keyboard", left: "Developer", right: "Maja Wirkijowska")
            FormRowStaticView(icon: "paintbrush", left: "Designer", right: "Robert Petras")
            FormRowStaticView(icon: "flag", left: "Version", right: "1.0.0")
            
          }) //: sec 4 -
          .padding(.vertical, 3)
          
        } //:  form -
        .listStyle(GroupedListStyle())
        .environment(\.horizontalSizeClass, .regular)
        
        // MARK: - footer
        Text("Copyright © All Rights Reserved\nBetter Apps ♡ Less Code")
          .multilineTextAlignment(.center)
          .font(.footnote)
          .padding(.top, 6)
          .padding(.bottom, 8)
          .foregroundColor(.secondary)
        
      } //: vstack - inside nav view
      .navigationBarTitle("Settings", displayMode: .inline)
      .background(colorBackground).edgesIgnoringSafeArea(.all)
      .toolbar{
        ToolbarItem(content: {
          Button(action: {
            self.presentationMode.wrappedValue.dismiss()
          }, label: {
            Image(systemName: "xmark").foregroundColor(.blue)
          })
        }) //: toolbaritem - close
      } //: toolbar() -
    } //: nav view -
    
  } //: body - 
} //:  struct - 

struct SettingsView_Previews: PreviewProvider {
  static var previews: some View {
    SettingsView().environmentObject(IconNames())
  }
}
