//
//  Enums.swift
//  MCTravel
//
//  Created by Maja Wirkijowska on 7/18/22.
//

import SwiftUI

// MARK: - drag state enum
enum DragState {
  case inactive
  case pressing
  case dragging(translation: CGSize)
  
  var translation: CGSize {
    switch self {
      case .inactive, .pressing:
        return .zero
      case .dragging(let translation):
        return translation
    }
  }
  
  var isDragging: Bool {
    switch self {
      case .dragging:
        return true
      case .inactive, .pressing:
        return false
    }
  }
  
  var isPressing: Bool {
    switch self {
      case .pressing:
        return true
      case .dragging, .inactive:
        return false
    }
  }
  
}
