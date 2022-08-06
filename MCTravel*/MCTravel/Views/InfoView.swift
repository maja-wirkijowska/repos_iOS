//
//  InfoView.swift
//  MCTravel
//
//  Created by Maja Wirkijowska on 7/18/22.
//

import SwiftUI

struct InfoView: View {
  // MARK: - props
  @Environment(\.dismiss) private var dismiss
  
  // MARK: - body
  var body: some View {
    
    ScrollView(.vertical, showsIndicators: false) {
      VStack(alignment: .center, spacing: 20) {
        
        HeaderComponent()
        
        Spacer(minLength: 10)
        
        Text("App Info")
          .fontWeight(.black)
          .modifier(TitleModifer())
        
        AppInfoView()
        
        Text("Credits")
          .fontWeight(.black)
          .modifier(TitleModifer())
        
        CreditsView()
        
        Spacer(minLength: 10)
        
        Button(action: {
          self.dismiss()
        }, label: {
          Text("Continue".uppercased())
            .modifier(ButtonModifier())
        })
        
      } //: vstack -
      .frame(minWidth: 0, maxWidth: .infinity)
      .padding(.top, 15)
      .padding(.bottom, 25)
      .padding(.horizontal, 25)
      
    } //:  scroll view
    
  } //: body -
} //: struct -

// MARK: - AppInfoView()
struct AppInfoView: View {
  var body: some View {
    VStack(alignment: .leading, spacing: 10) {
      RowAppInfoView(left: "Application", right: "Honeymoon")
      RowAppInfoView(left: "Compatability", right: "iPhone/iPad")
      RowAppInfoView(left: "Developer", right: "Maja Wirkijowska")
      RowAppInfoView(left: "Designer", right: "Robert Petras")
      RowAppInfoView(left: "Website", right: website)
      RowAppInfoView(left: "Version", right: "1.0.0")
    } //: vstack -
  } //: body -
} //: struct -

// MARK: - RowAppInfoView()
struct RowAppInfoView: View {
  // props
  var left: String
  var right: String
  
  var body: some View {
    VStack {
      HStack {
        Text(left).foregroundColor(.gray)
        Spacer()
        Text(right)
      }
      Divider()
    }
  }
}

// MARK: - CreditsView()
struct CreditsView: View {
  var body: some View {
    VStack(alignment: .leading, spacing: 10) {
      HStack {
        Text("Photos").foregroundColor(.gray)
        Spacer()
        Text("Unsplash")
      }
      Divider()
      Text("Photographers").foregroundColor(.gray)
      Text("Shifaaz Shamoon (Maldives), Grillot Edouard (France), Evan Wise (Greece), Christoph Schulz (United Arab Emirates), Andrew Coelho (USA), Damiano Baschiera (Italy), Daniel Olah (Hungary), Andrzej Rusinowski (Poland), Lucas Miguel (Slovenia), Florencia Potter (Spain), Ian Simmonds (USA), Ian Keefe (Canada), Denys Nevozhai (Thailand), David Köhler (Italy), Andre Benz (USA), Alexandre Chambon (South Korea), Roberto Nickson (Mexico), Ajit Paul Abraham (UK), Jeremy Bishop (USA), Davi Costa (Brazil), Liam Pozz (Australia)")
        .multilineTextAlignment(.leading)
        .font(.footnote)
    }
  }
}

// MARK: - preview
struct InfoView_Previews: PreviewProvider {
  static var previews: some View {
    InfoView()
  }
}




