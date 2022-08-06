//
//  ContentView.swift
//  MCTravel
//
//  Created by Maja Wirkijowska on 7/18/22.
//

import SwiftUI

struct ContentView: View {
  // MARK: - props
  @State var showAlert: Bool = false
  @State var showGuide: Bool = false
  @State var showInfo: Bool = false
  @State private var lastCardIndex: Int = 1
  @State private var cardRemovalTransition = AnyTransition.trailingBottom
  @GestureState private var dragState = DragState.inactive
  private var dragAreaThreashold: CGFloat = 65.0
  
  // MARK: - move cards
  private func moveCards() {
    cardViews.removeFirst()
    self.lastCardIndex += 1
    let destination = destinationData[lastCardIndex % destinationData.count]
    let newCardView = CardView(destination: destination)
    cardViews.append(newCardView)
  }
  
  // MARK: - card views
  @State var cardViews: [CardView] = {
    var views = [CardView]()
    for index in 0 ..< 2 {
      views.append(CardView(destination: destinationData[index]))
    }
    return views
  }()
  
  // MARK: - top card
  private func isTopCard(cardView: CardView) -> Bool {
    guard let index = cardViews.firstIndex(where: { $0.id == cardView.id }) else {
      return false
    }
    return index == 0
  }
  
  // MARK: - body
  var body: some View {
    
    VStack {
      // MARK: - header
      HeaderView(showGuideView: $showGuide, showInfoView: $showInfo)
        .opacity(dragState.isDragging ? 0.0 : 1.0)
        .animation(.default, value: dragState.isDragging)
      
      Spacer()
      
      // MARK: - cards
      ZStack {
        ForEach(cardViews) { cardView in
          cardView
            .zIndex(self.isTopCard(cardView: cardView) ? 1 : 0)
            .overlay(
              ZStack {
                // xmark
                Image(systemName: "xmark.circle")
                  .modifier(SymbolModifier())
                  .opacity(self.dragState.translation.width < -self.dragAreaThreashold && self.isTopCard(cardView: cardView) ? 1 : 0)
                // heart
                Image(systemName: "heart.circle")
                  .modifier(SymbolModifier())
                  .opacity(self.dragState.translation.width > self.dragAreaThreashold && self.isTopCard(cardView: cardView) ? 1 : 0)
              } //: zstack - overlay
            ) //: overlay
            .offset(
              x: self.isTopCard(cardView: cardView) ? self.dragState.translation.width : 0,
              y: self.isTopCard(cardView: cardView) ? self.dragState.translation.height : 0)
            .scaleEffect(self.dragState.isDragging && self.isTopCard(cardView: cardView) ? 0.85 : 1.0)
            .rotationEffect(Angle(degrees: self.isTopCard(cardView: cardView) ? Double(self.dragState.translation.width / 12) : 0))
            .animation(.interpolatingSpring(stiffness: 120, damping: 120), value:self.dragState.isDragging)
            .gesture(LongPressGesture(minimumDuration: 0.01)
              .sequenced(before: DragGesture())
              .updating(self.$dragState, body: { value, state, transaction in
                switch value {
                  case .first(true):
                    state = .pressing
                  case .second(true, let drag):
                    state = .dragging(translation: drag?.translation ?? .zero)
                  default:
                    break
                }
              })
              .onChanged({ (value) in
                guard case .second(true, let drag?) = value else { return }
                if (drag.translation.width < -self.dragAreaThreashold) {
                  self.cardRemovalTransition = .leadingBottom
                }
                if (drag.translation.width > self.dragAreaThreashold) {
                  self.cardRemovalTransition = .trailingBottom
                }
              })
              .onEnded({ (value) in
                guard case .second(true, let drag?) = value else { return }
                if (drag.translation.width < -self.dragAreaThreashold || drag.translation.width > self.dragAreaThreashold) {
                  playSound(sound: "sound-rise", type: "mp3")
                  self.moveCards()
                }
              }) //: onEnded() - 
            ) //: gesture -
            .transition(self.cardRemovalTransition)
        }
      } //: ztack - cards
      .padding(.horizontal)
      
      Spacer()
      
      // MARK: - footer
      FooterView(showBookingAlert: $showAlert)
        .opacity(dragState.isDragging ? 0.0 : 1.0)
        .animation(.default, value: dragState.isDragging)
      
    } //: vstack - main
    .alert(isPresented: $showAlert) {
      Alert(
        title: Text("Success!!"),
        message: Text("Wishing you a lovely and memerable time!!"),
        dismissButton: .default(Text("Happy Travels!!"))
      )
    } //: alert - $showAlert
      
  } //: body -
} //:  struct -

// MARK: - preview
struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView()
  }
}
