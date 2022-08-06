//
//  PowerMonitor_test.swift
//  UTPracticeTests
//
//  Created by Maja Wirkijowska on 7/27/22.
//

import XCTest
@testable import UTPractice

class PowerMonitor_test: XCTestCase {

  func test_unpluggedDeviceShowsDown() {
    // GIVEN
    let sut = PowerMonitor(device: DeviceMock(testBatteryState: .unplugged))
    // WHEN
    let message = sut.getStatus()
    // THEN
    XCTAssertEqual(message, "Power is down.")
  }
  
}
