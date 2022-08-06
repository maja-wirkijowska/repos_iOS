//
//  Profile.swift
//  Landmarks
//
//  Created by Maja Wirkijowska on 6/22/22.
//

import Foundation

struct Profile {
    var username: String
    var prefersNotifications = true
    var seasonalPhoto = Season.winter
    var goalDate = Date()
    
    static let `default` = Profile(username: "maya")
    
    enum Season: String, CaseIterable, Identifiable {
            case spring = "🌷"
            case summer = "🌞"
            case autumn = "🍂"
            case winter = "☃️"

            var id: String { rawValue }
        }
    
}
