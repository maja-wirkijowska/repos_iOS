//
//  SourceLinkView.swift
//  Fructus
//
//  Created by Maja Wirkijowska on 6/28/22.
//

import SwiftUI

struct SourceLinkView: View {
    var body: some View {
        GroupBox() { // acts as vertical view, so we need hstack inside it
            HStack {
                Text("Contents Source")
                Spacer()
                Link("Wikipedia", destination: URL(string: "https://wikipedia.com")!)
                Image(systemName: "arrow.up.right.square")
            }
            .font(.footnote)
        }
    }
}

struct SourceLinkView_Previews: PreviewProvider {
    static var previews: some View {
        SourceLinkView()
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
