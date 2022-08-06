//
//  CodableBundleExtension.swift
//  Touchdown
//
//  Created by Maja Wirkijowska on 7/1/22.
//

import Foundation

extension Bundle {
  func decode<T: Codable>(_ file: String) -> T {
    
    guard let url = self.url(forResource: file, withExtension: nil) else {
      fatalError("Failed to located \(file) in bundle")
    }
    
    guard let data = try? Data(contentsOf: url) else {
      fatalError("Failed to load \(file) from bundle")
    }
    
    let decoder = JSONDecoder()
    
    guard let decodedData = try? decoder.decode(T.self, from: data) else {
      fatalError("Failed to decode \(file) from bundle")
    }
    
    return decodedData
    
  }
}
