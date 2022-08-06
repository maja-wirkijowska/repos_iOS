//
//  User_test.swift
//  AsyncTests
//
//  Created by Maja Wirkijowska on 7/26/22.
//

import XCTest
@testable import UTPractice

class User_test: XCTestCase {

  func test_userUpgradedPostsNotification() {
    // GIVEN
    let user = User()
    let expectation = XCTNSNotificationExpectation(name: User.upgradeNotification)
    // WHEN
    user.upgrade()
    // THEN
    wait(for: [expectation], timeout: 3)
  }
  
  func test_userUpgradedPostsNotification2() {
    // GIVEN
    let user = User()
    let expectation = XCTNSNotificationExpectation(name: User.upgradeNotification)
    expectation.handler = { notification -> Bool in
      guard let level = notification.userInfo?["level"] as? String else { return false }
      
      if level == "gold" {
        return true
      } else {
        return false
      }
    }
    // WHEN
    user.upgrade()
    // THEN
    wait(for: [expectation], timeout: 3)
  }
  
  func test_userUpgradedPostsNotification3() {
    // GIVEN
    let center = NotificationCenter()
    let user = User()
    let expectation = XCTNSNotificationExpectation(name: User.upgradeNotification, object: nil, notificationCenter: center)
    
    expectation.handler = { notification -> Bool in
      guard let level = notification.userInfo?["level"] as? String else { return false }
      
      if level == "gold" {
        return true
      } else {
        return false
      }
    }
    // WHEN
    user.upgrade(using: center)
    // THEN
    wait(for: [expectation], timeout: 3)
  }

}
