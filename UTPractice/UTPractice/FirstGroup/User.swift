//
//  User.swift
//  UTPractice
//
//  Created by Maja Wirkijowska on 7/26/22.
//

import SwiftUI

struct User {
  
  static let upgradeNotification = Notification.Name("UserUpgraded")
  
  func upgrade(using center: NotificationCenter = NotificationCenter.default) {
    DispatchQueue.global().async {
      Thread.sleep(forTimeInterval: 1)
      center.post(name: User.upgradeNotification, object: nil, userInfo: ["level": "gold"])
    }
  }
}
