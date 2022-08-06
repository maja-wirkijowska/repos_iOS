//
//  Tweet.swift
//  UTPractice
//
//  Created by Maja Wirkijowska on 7/26/22.
//

import SwiftUI

struct Tweet {
  var text: String
  var author: String
  var date: Date
  
  init(text: String, author: String, date: Date = Date()) {
    self.text = text
    self.author = author
    self.date = date
  }
}
