//
//  PlaySound.swift
//  MCTravel
//
//  Created by Maja Wirkijowska on 7/18/22.
//

import AVFoundation

var audioPlayer: AVAudioPlayer?

func playSound(sound: String, type: String) {
  if let path = Bundle.main.path(forResource: sound, ofType: type) {
    do {
      audioPlayer = try AVAudioPlayer(contentsOf: URL(fileURLWithPath: path))
      audioPlayer?.play()
    } catch {
      print("ERROR: Could not find or play sound")
    }
  }
}
