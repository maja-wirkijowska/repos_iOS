//
//  RipeStagesView.swift
//  Avocados
//
//  Created by Maja Wirkijowska on 7/7/22.
//

import SwiftUI

struct RipeStagesView: View {
  // MARK: - props
  var ripeningStage: [Ripening] = ripeningData
  
  // MARK: - body
  var body: some View {
    
    ScrollView(.horizontal, showsIndicators: false) {
      VStack {
        Spacer()
        HStack(alignment: .center, spacing: 25) {
          ForEach(ripeningStage) { item in
            RipeningView(ripening: item)
          }
        }
        .padding(.vertical)
        .padding(.horizontal, 25)
        Spacer()
      }
    }
    .edgesIgnoringSafeArea(.all)
    
  } //: body
} //: struct

// MARK: - preview
struct RipeStagesView_Previews: PreviewProvider {
  static var previews: some View {
    RipeStagesView(ripeningStage: ripeningData)
  }
}
