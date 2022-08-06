//
//  MapView.swift
//  Africa
//
//  Created by Maja Wirkijowska on 6/29/22.
//

import SwiftUI
import MapKit

struct MapView: View {
  // MARK: - props
  @State private var region: MKCoordinateRegion = {
    var mapCoordinates = CLLocationCoordinate2D(latitude: 6.600286, longitude: 16.4377599)
    var mapZoomLevel = MKCoordinateSpan(latitudeDelta: 70.0, longitudeDelta: 70.0)
    var mapRegion = MKCoordinateRegion(center: mapCoordinates, span: mapZoomLevel)
    return mapRegion
  }()
  let locations: [NationalParkLocation] = Bundle.main.decode("locations.json")
  
  // MARK: - body
  var body: some View {
    
    // MARK: - 1. basic map
    //Map(coordinateRegion: $region)
    
    // MARK: - 2. map with annotations
    Map(coordinateRegion: $region, annotationItems: locations, annotationContent: { item in
      // A. old style - always static
      //MapPin(coordinate: item.location, tint: .accentColor)
      
      // B. marker - new style - always static
      //MapMarker(coordinate: item.location, tint: .accentColor)
      
      // C. custom basic annimation
//      MapAnnotation(coordinate: item.location) {
//        Image("logo")
//          .resizable().scaledToFit()
//          .frame(width: 32, height: 32, alignment: .center)
//      } //: custom annotation.c
      
      // D. custom complex map animation - interactive option
      MapAnnotation(coordinate: item.location) {
        MapAnnotationView(location: item)
      }
    }) //: MAP
    .overlay(
      HStack(alignment: .center, spacing: 12) {
        Image("compass")
          .resizable()
          .scaledToFit()
          .frame(width: 48, height: 48, alignment: .center)
        
        VStack(alignment: .leading, spacing: 3) {
          HStack {
            Text("Latitude: ")
              .font(.footnote)
              .fontWeight(.bold)
              .foregroundColor(.accentColor)
            Spacer()
            Text("\(region.center.latitude)")
              .font(.footnote)
              .foregroundColor(.white)
            
          } //: hstack
          Divider()
          HStack {
            Text("Longitude: ")
              .font(.footnote)
              .fontWeight(.bold)
              .foregroundColor(.accentColor)
            Spacer()
            Text("\(region.center.longitude)")
              .font(.footnote)
              .foregroundColor(.white)
          } //: hstack
          
        } //: vstack
        
        
      } //: hstack
        .padding(.vertical, 12)
        .padding(.horizontal, 16)
        .background(
          Color.black
            .cornerRadius(8)
            .opacity(0.6)
        )
        .padding()
        , alignment: .top
    ) //: overlay
    
  } //: body
}

// MARK: - preview
struct MapView_Previews: PreviewProvider {
  static var previews: some View {
    MapView()
  }
}
