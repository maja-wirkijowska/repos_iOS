//
//  FooterView.swift
//  MCTravel
//
//  Created by Maja Wirkijowska on 7/18/22.
//

import SwiftUI

struct FooterView: View {
  // MARK: - props
  @Binding var showBookingAlert: Bool
  let haptics = UINotificationFeedbackGenerator()
  
  // MARK: - body
  var body: some View {
    
    HStack {
      Image(systemName: "xmark.circle")
        .font(.system(size: 42, weight: .light))
      
      Spacer()
      
      Button(action: {
        playSound(sound: "sound-click", type: "mp3")
        self.haptics.notificationOccurred(.success)
        self.showBookingAlert.toggle()
      }, label: {
        Text("Book Trip".uppercased())
          .font(.system(.subheadline, design: .rounded))
          .fontWeight(.heavy)
          .padding(.horizontal, 20)
          .padding(.vertical, 12)
          .accentColor(.pink)
          .background(
            Capsule().stroke(.pink, lineWidth: 2)
          )
      })
      
      Spacer()
      
      Image(systemName: "heart.circle")
        .font(.system(size: 42, weight: .light))
      
    } //: hstack - main
    .padding()
    
  } //: body -
} //: struct -

// MARK: - preview
struct FooterView_Previews: PreviewProvider {
  @State static var showAlert: Bool = false
  static var previews: some View {
    FooterView(showBookingAlert: $showAlert)
      .previewLayout(.fixed(width: 375, height: 80))
  }
}
