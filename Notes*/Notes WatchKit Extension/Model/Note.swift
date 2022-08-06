//
//  Note.swift
//  Notes WatchKit Extension
//
//  Created by Maja Wirkijowska on 7/5/22.
//

import Foundation

struct Note: Identifiable, Codable {
  
  let id: UUID
  let text: String
}
