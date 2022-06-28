//
//  PageModel.swift
//  Pinch
//
//  Created by Maja Wirkijowska on 6/28/22.
//

import Foundation

struct Page: Identifiable {
    let id: Int
    let imageName: String
    
}

extension Page {
    var thumbnailName: String {
        return "thumb-" + imageName
    }
}
