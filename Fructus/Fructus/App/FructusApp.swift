//
//  FructusApp.swift
//  Fructus
//
//  Created by Maja Wirkijowska on 6/28/22.
//

import SwiftUI

@main
struct FructusApp: App {
    // MARK: -  props
    @AppStorage("isOnboarding") var isOnboarding: Bool = true   //uses permanet storage on the device
    
    // MARK: -  body
    var body: some Scene {
        WindowGroup {
            if (isOnboarding) {
                OnboardingView()
            } else {
                ContentView()
            }
        }
    }
}
