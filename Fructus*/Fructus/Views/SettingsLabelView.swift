//
//  SettingsLabelView.swift
//  Fructus
//
//  Created by Maja Wirkijowska on 6/28/22.
//

import SwiftUI

struct SettingsLabelView: View {
    // MARK: -  props
    var labelText: String
    var labelImage: String
    
    // MARK: -  func
    
    // MARK: -  body
    var body: some View {
        
        HStack {
            Text(labelText.uppercased()).fontWeight(.bold)
            Spacer()
            Image(systemName: labelImage)
            
        } //: hstack
    }
}

// MARK: -  preview
struct SettingsLabelView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsLabelView(labelText: "Fructus", labelImage: "info.circle")
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
