//
//  CategoryModel.swift
//  Touchdown
//
//  Created by Maja Wirkijowska on 7/1/22.
//

import Foundation

struct Category: Codable, Identifiable {
  let id: Int
  let name: String
  let image: String
}
