//
//  HeaderView.swift
//  MCTravel
//
//  Created by Maja Wirkijowska on 7/18/22.
//

import SwiftUI

struct HeaderView: View {
  // MARK: - props
  @Binding var showGuideView: Bool
  @Binding var showInfoView: Bool
  let haptics = UINotificationFeedbackGenerator()
  
  // MARK: - body
  var body: some View {
    
    HStack {
      Button(action: {
        playSound(sound: "sound-click", type: "mp3")
        self.showInfoView.toggle()
      }, label: {
        Image(systemName: "info.circle")
          .font(.system(size: 24, weight: .regular))
      })
      .accentColor(.primary)
      .sheet(isPresented: $showInfoView, content: { InfoView() })
      
      Spacer()
      
      Image(logoPink)
        .resizable()
        .scaledToFit()
        .frame(height: 28)
      
      Spacer()
      
      Button(action: {
        playSound(sound: "sound-click", type: "mp3")
        self.haptics.notificationOccurred(.success)
        self.showGuideView.toggle()
      }, label: {
        Image(systemName: "questionmark.circle")
          .font(.system(size: 24, weight: .regular))
      })
      .accentColor(.primary)
      .sheet(isPresented: $showGuideView) {
        GuideView()
      }
      
    } //: hsatck - main container
    .padding()
    
  } //: body -
} //: struct

// MARK: - preview
struct HeaderView_Previews: PreviewProvider {
  @State static var showGuide: Bool = false
  @State static var showInfo: Bool = false
  static var previews: some View {
    HeaderView(showGuideView: $showGuide, showInfoView: $showInfo)
      .previewLayout(.fixed(width: 375, height: 80))
  }
}
