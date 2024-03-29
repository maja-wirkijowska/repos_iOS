//
//  ContentView.swift
//  ConverterUnitTesting
//
//  Created by Maja Wirkijowska on 7/25/22.
//

import SwiftUI

struct ContentView: View {
  @StateObject private var vm = ViewModel()
  
  var body: some View {
    
    Form {
      VStack(spacing: 20) {
        Text("\(vm.convertedText)")
          .font(.headline)
        TextField("Enter an amount: ", text: $vm.text)
          .textFieldStyle(.roundedBorder)
          .keyboardType(.decimalPad)
          .submitLabel(.done)
        Button("Convert") {
          vm.convertMoney()
        }
        .buttonStyle(.borderedProminent)
      }
      .padding()
    }
  }
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView()
  }
}
