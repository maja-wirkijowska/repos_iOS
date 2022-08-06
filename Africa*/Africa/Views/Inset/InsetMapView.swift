//
//  InsetMapView.swift
//  Africa
//
//  Created by Maja Wirkijowska on 6/29/22.
//

import SwiftUI
import MapKit

struct InsetMapView: View {
  // MARK: - props
  @State private var region = MKCoordinateRegion(
    center:
      CLLocationCoordinate2D(
        latitude: 6.600286,
        longitude: 16.4377599),
    span:
      MKCoordinateSpan(
        latitudeDelta: 60.0,
        longitudeDelta: 60.0))
  
  // MARK: - body
  var body: some View {
    
    Map(coordinateRegion: $region)
      .overlay(
        NavigationLink(destination: MapView()) {
          HStack {
            Image(systemName: "mappin.circle")
              .foregroundColor(.white)
              .imageScale(.large)
            
            Text("Locations")
              .foregroundColor(.accentColor)
              .fontWeight(.bold)
            
          } //: hstack
          .padding(.vertical, 10)
          .padding(.horizontal, 14)
          .background(
            Color.black
              .opacity(0.4)
              .cornerRadius(8)
          ) //: background color
          
        } //:  nav link
          .padding(12)
        , alignment: .topTrailing
      )
      .frame(height: 256)
      .cornerRadius(12)
    
  } //: body
}

// MARK: - preview
struct InsetMapView_Previews: PreviewProvider {
  static var previews: some View {
    InsetMapView()
      .previewLayout(.sizeThatFits)
      .padding()
  }
}
