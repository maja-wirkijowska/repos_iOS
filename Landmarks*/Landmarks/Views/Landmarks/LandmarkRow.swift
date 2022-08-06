//
//  LandmarkRow.swift
//  Landmarks
//
//  Created by Maja Wirkijowska on 6/22/22.
//

import SwiftUI

struct LandmarkRow: View {
    // MARK: - properties
    var landmark: Landmark
    
    // MARK: - body
    var body: some View {
        HStack {
            landmark.image
                .resizable()
                .frame(width: 50, height: 50)
                .cornerRadius(5)
            VStack (alignment: .leading) {
                Text(landmark.name)
                    .bold()
                #if !os(watchOS)
                Text(landmark.park)
                    .font(.caption)
                    .foregroundColor(.secondary)
                #endif
            }
            Spacer()
            
            if (landmark.isFavorite) {
                Image(systemName: "star.fill")
                    .foregroundColor(.yellow)
            }
            
        } //: HStack
        .padding(.vertical, 4)
    } //: body
}

struct LandmarkRow_Previews: PreviewProvider {
    static var landmarks = ModelData().landmarks
    
    static var previews: some View {
        Group {
            LandmarkRow(landmark: landmarks[0])
            LandmarkRow(landmark: landmarks[1])
        }
        .previewLayout(.fixed(width: 300, height: 70))
        
    }
}
