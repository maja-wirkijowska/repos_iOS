//
//  CircleImage.swift
//  Landmarks
//
//  Created by Maja Wirkijowska on 6/22/22.
//

import SwiftUI

struct CircleImage: View {
    // MARK: - properties
    var image: Image
    
    // MARK: - body
    var body: some View {
        image
            .clipShape(Circle())
            .overlay {
                Circle().stroke(.white, lineWidth: 4)
            }
            .shadow(radius: 7)
    } //: body
}

struct CircleImage_Previews: PreviewProvider {
    static var previews: some View {
        CircleImage(image: Image("turtlerock"))
    }
}
