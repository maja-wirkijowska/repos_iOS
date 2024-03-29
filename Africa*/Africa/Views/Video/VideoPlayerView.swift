//
//  VideoPlayerView.swift
//  Africa
//
//  Created by Maja Wirkijowska on 6/30/22.
//

import SwiftUI
import AVKit

struct VideoPlayerView: View {
  // MARK: - props
  var videoSelected: String
  var videoTitle: String
  
  // MARK: - body
  var body: some View {
    
    VStack {
      VideoPlayer(player: playVideo(fileName: videoSelected, fileFormat: "mp4")) {
        //Text(videoTitle)
      } //: videoplayer
      .overlay(
        Image("logo")
          .resizable()
          .scaledToFit()
          .frame(width: 32, height: 32)
          .padding(.top, 6)
          .padding(.horizontal, 8)
        , alignment: .topLeading
      )
    } //: vstack
    .accentColor(.accentColor)
    .navigationBarTitle(videoTitle, displayMode: .inline)
    
  } //: body
}

// MARK: - preview
struct VideoPlayerView_Previews: PreviewProvider {
  static var previews: some View {
    NavigationView {
      VideoPlayerView(videoSelected: "lion", videoTitle: "Lion")
    }
  }
}
