//
//  SoundPlayer.swift
//  Devote
//
//  Created by Maja Wirkijowska on 7/5/22.
//

import Foundation
import AVFoundation

var audioPlayer: AVAudioPlayer?

func playSound(sound: String, type: String) {
  if let path = Bundle.main.path(forResource: sound, ofType: type) {
    do {
      audioPlayer = try AVAudioPlayer(contentsOf: URL(fileURLWithPath: path))
      audioPlayer?.play()
    } catch {
      print("Could not find or play the sound file")
    }
  }
}
