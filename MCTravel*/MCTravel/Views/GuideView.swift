//
//  GuideView.swift
//  MCTravel
//
//  Created by Maja Wirkijowska on 7/18/22.
//

import SwiftUI

struct GuideView: View {
  // MARK: - props
  @Environment(\.dismiss) private var dismiss
  
  // MARK: - body
  var body: some View {
    
    ScrollView(.vertical, showsIndicators: false) {
      VStack(alignment: .center, spacing: 20) {
        HeaderComponent()
        Spacer(minLength: 10)
        
        Text("Get Started")
          .fontWeight(.black)
          .modifier(TitleModifer())
        
        Text("Discover and book the perfect destination for your honeymoon")
          .lineLimit(nil)
          .multilineTextAlignment(.center)
        
        Spacer(minLength: 10)
        
        VStack(alignment: .leading, spacing: 25, content: {
          GuideComponent(title: "Like", subtitle: "Swipe Right", description: "Do you like this destination? Swipe right to save to Favorites", icon: "heart.circle")
          
          GuideComponent(title: "Dismiss", subtitle: "Swipe Left", description: "To skip, swipe left. You will no longer see this destination", icon: "xmark.circle")
          
          GuideComponent(title: "Book", subtitle: "Tap the Button", description: "Our selection of honeymoon destinations is will help you find the perfect setting to start your new life together", icon: "checkmark.square")
        }) //: vstack -
        
        Spacer(minLength: 10)
        
        Button(action: {
          self.dismiss()
        }, label: {
          Text("Continue".uppercased())
            .modifier(ButtonModifier())
        })
        
      } //: vstack - in scroll view
      .frame(minWidth: 0, maxWidth: .infinity)
      .padding(.top, 15)
      .padding(.bottom, 25)
      .padding(.horizontal, 25)
    } //: scroll view -
    
  } //: body -
} //: struct

// MARK: - preview
struct GuideView_Previews: PreviewProvider {
  static var previews: some View {
    GuideView()
  }
}
