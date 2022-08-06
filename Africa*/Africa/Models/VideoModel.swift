//
//  VideoModel.swift
//  Africa
//
//  Created by Maja Wirkijowska on 6/30/22.
//

import Foundation

struct Video: Codable, Identifiable {
  let id: String
  let name: String
  let headline: String
  
  var thumbnail: String {
    "video-\(id)"
  }
}
