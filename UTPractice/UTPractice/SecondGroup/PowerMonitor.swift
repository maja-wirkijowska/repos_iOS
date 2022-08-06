//
//  PowerMonitor.swift
//  UTPractice
//
//  Created by Maja Wirkijowska on 7/27/22.
//

import SwiftUI

struct PowerMonitor {
  var device: DeviceProtocol
  
  func getStatus() -> String {    
    if device.batteryState == .unplugged {
      return "Power is down."
    } else if device.batteryState == .unknown {
      return "Error"
    } else {
      return "Power is up"
    }
  }
}

class DeviceMock: UIDevice {
  var testBatteryState: BatteryState
  
  init(testBatteryState: BatteryState) {
    self.testBatteryState = testBatteryState
    super.init()
  }
  override var batteryState: BatteryState {
    return testBatteryState
  }
}


protocol DeviceProtocol {
  var batteryState: UIDevice.BatteryState { get }
}

extension UIDevice: DeviceProtocol { }

struct DeviceMockStruct: DeviceProtocol {
  var testBatteryState: UIDevice.BatteryState

  var batteryState: UIDevice.BatteryState {
    return testBatteryState
  }
}
