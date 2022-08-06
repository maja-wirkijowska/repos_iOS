//
//  RatingSizesDetailView.swift
//  Touchdown
//
//  Created by Maja Wirkijowska on 7/1/22.
//

import SwiftUI

struct RatingSizesDetailView: View {
  // MARK: - props
  let sizes: [String] = [ "XS", "S", "M", "L", "XL" ]
  
  // MARK: - body
  var body: some View {
  
    HStack(alignment: .top, spacing: 3, content: {
      // Ratings
      VStack(alignment: .leading, spacing: 3, content: {
        Text("Ratings")
          .font(.footnote)
          .fontWeight(.semibold)
          .foregroundColor(colorGray)
        
        HStack(alignment: .center, spacing: 3, content: {
          ForEach(1 ... 5, id: \.self) { item in
            Button(action: {}, label: {
              Image(systemName: "star.fill")
                .frame(width: 28, height: 28)
                .background(colorGray.cornerRadius(5))
                .foregroundColor(.white)
            }) //: star button
          } //: loop
        }) //: hstack
        
      }) //: vstack
      
      Spacer()
      
      // sizes
      VStack(alignment: .trailing, spacing: 3, content: {
        Text("Sizes")
          .font(.footnote)
          .fontWeight(.semibold)
          .foregroundColor(colorGray)
        
        HStack(alignment: .center, spacing: 5, content: {
          
          ForEach(sizes, id: \.self) { size in
          
            Button(action: {}, label: {
            
              Text(size)
                .font(.footnote)
                .fontWeight(.heavy)
                .foregroundColor(colorGray)
                .frame(width: 28, height: 28, alignment: .center)
                .background(Color.white.cornerRadius(5))
                .background(
                  RoundedRectangle(cornerRadius: 5)
                    .stroke(colorGray, lineWidth: 2))
            }) //: size buttons
          } //: loop
        }) //: hstack
      }) //: vstack
      
    }) //: hstack
    
  } //: body
}

// MARK: - preview
struct RatingSizesDetailView_Previews: PreviewProvider {
  static var previews: some View {
    RatingSizesDetailView()
      .previewLayout(.sizeThatFits)
      .padding()
  }
}
