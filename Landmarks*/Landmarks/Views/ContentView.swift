//
//  ContentView.swift
//  Landmarks
//
//  Created by Maja Wirkijowska on 6/22/22.
//

import SwiftUI

struct ContentView: View {
    // MARK: - properties
    @State private var selection: Tab = .featured
    
    enum Tab {
        case featured
        case list
    }
    
    // MARK: - body
    var body: some View {
        TabView(selection: $selection) {
            CategoryHome()
                .tabItem {
                    Label("Featured", systemImage: "star")
                }
                .tag(Tab.featured)
            LandmarkList()
                .tabItem {
                    Label("List", systemImage: "list.bullet")
                }
                .tag(Tab.list)
        }
    } //: body
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(ModelData())
    }
}
