//
//  ContentView.swift
//  Slots
//
//  Created by Maja Wirkijowska on 7/14/22.
//

import SwiftUI

struct ContentView: View {
  // MARK: - props
  @State private var showingInfoView: Bool = false
  let symbols = [bell, cherry, coin, grape, seven, strawberry]
  @State private var reels: Array = [0, 1, 2]
  @State private var highScore: Int = UserDefaults.standard.integer(forKey: "HighScore")
  @State private var coins: Int = 100
  @State private var betAmount: Int = 10
  @State private var isActiveBet10: Bool = true
  @State private var isActiveBet20: Bool = false
  @State private var showPopup: Bool = false
  @State private var animatingSymbol: Bool = false
  @State private var animatingPopup: Bool = false
  let haptics = UINotificationFeedbackGenerator()
  
  // MARK: - functions
  
  // spin
  func spinReels() {
//    reels[0] = Int.random(in: 0 ... symbols.count - 1)
//    reels[1] = Int.random(in: 0 ... symbols.count - 1)
//    reels[2] = Int.random(in: 0 ... symbols.count - 1)
    reels = reels.map({ _ in
      Int.random(in: 0 ... symbols.count - 1)
    })
    playSound(sound: "spin", type: "mp3")
    haptics.notificationOccurred(.success)
  }
  
  // check
  func checkWinnings() {
    if (reels[0] == reels[1] && reels[0] == reels[2] && reels[1] == reels[2]) {
      playerWins()
      if (coins > highScore) {
        newHighScore()
      } else {
        playSound(sound: "win", type: "mp3")
      }
    } else {
      playerLoses()
    }
  }
  
  func playerWins() {
    coins += betAmount * 10
  }
  func newHighScore() {
    highScore = coins
    UserDefaults.standard.set(highScore, forKey: "HighScore")
    playSound(sound: "high-score", type: "mp3")
  }
  func playerLoses() {
    coins -= betAmount
  }
  
  func activeBet20() {
    betAmount = 20
    isActiveBet20 = true
    isActiveBet10 = false
    playSound(sound: "casino-chips", type: "mp3")
    haptics.notificationOccurred(.success)
  }
  func activeBet10() {
    betAmount = 10
    isActiveBet10 = true
    isActiveBet20 = false
    playSound(sound: "casino-chips", type: "mp3")
    haptics.notificationOccurred(.success)
  }
  
  func isGameOver() {
    if (coins <= 0) {
      showPopup = true
      playSound(sound: "game-over", type: "mp3")
    }
  }
  
  func resetGame() {
    UserDefaults.standard.set(0, forKey: "HighScore")
    highScore = 0
    coins = 100
    activeBet10()
    playSound(sound: "chimeup", type: "mp3")
  }
  
  // MARK: - body
  var body: some View {
    
    ZStack {
      // MARK: - background
      LinearGradient(gradient: pinkPurpleGradient, startPoint: .top, endPoint: .bottom)
        .edgesIgnoringSafeArea(.all)
      
      // MARK: - interface
      VStack(alignment: .center, spacing: 5) {
        
        // MARK: - header
        LogoView()
        Spacer()
        
        // MARK: - score
        HStack {
          HStack{
            Text("Your\nCoins".uppercased())
              .scoreLabelStyle()
              .multilineTextAlignment(.trailing)
            
            Text("\(coins)")
              .scoreNumberStyle()
              .modifier(ScoreNumberModifier())
            
          } //: hstack - score
          .modifier(ScoreContainerModifier())
          
          Spacer()
          
          HStack{
            Text("\(highScore)")
              .scoreNumberStyle()
              .modifier(ScoreNumberModifier())
            
            Text("High\nScore".uppercased())
              .scoreLabelStyle()
              .multilineTextAlignment(.leading)
            
          } //: hstack - score
          .modifier(ScoreContainerModifier())
        }
        
        
        // MARK: - slots
        VStack(alignment: .center, spacing: 0) {
          
          
          // MARK: - reel 1 - index 0
          ZStack {
            ReelView()
            Image(symbols[reels[0]])
              .resizable()
              .modifier(ImageModifier())
              .opacity(animatingSymbol ? 1 : 0)
              .offset(y: animatingSymbol ? 0 : -50)
              .animation(.easeOut(duration: Double.random(in: 0.5 ... 0.7)), value: animatingSymbol)
              .onAppear(perform: {
                self.animatingSymbol.toggle()
                playSound(sound: "riseup", type: "mp3")
              })
          } //: zstack - reel 1
          
          
          HStack(alignment: .center, spacing: 0) {
            // MARK: - reel 2 - index 1
            ZStack {
              ReelView()
              Image(symbols[reels[1]])
                .resizable()
                .modifier(ImageModifier())
                .opacity(animatingSymbol ? 1 : 0)
                .offset(y: animatingSymbol ? 0 : -50)
                .animation(.easeOut(duration: Double.random(in: 0.7 ... 0.9)), value: animatingSymbol)
                .onAppear(perform: {
                  self.animatingSymbol.toggle()
                })
            } //: zstack - reel 2
            Spacer()
            // MARK: - reel 3 - index 2
            ZStack {
              ReelView()
              Image(symbols[reels[2]])
                .resizable()
                .modifier(ImageModifier())
                .opacity(animatingSymbol ? 1 : 0)
                .offset(y: animatingSymbol ? 0 : -50)
                .animation(.easeOut(duration: Double.random(in: 0.9 ... 1.1)), value: animatingSymbol)
                .onAppear(perform: {
                  self.animatingSymbol.toggle()
                })
            } //: zstack - reel 3
          } //: hstack - reels 2 and 3
          .frame(maxWidth: 500)
          
          
          
          // MARK: - spin button
          Button(action: {
            // 1. set default state
            withAnimation {
              self.animatingSymbol = false
            }
            // 2. spin
            self.spinReels()
            // 3. trigger animation
            withAnimation {
              self.animatingSymbol = true
            }
            // 4. check
            self.checkWinnings()
            // 5. game over
            self.isGameOver()
          }, label: {
            Image(spin)
              .renderingMode(.original)
              .resizable()
              .modifier(ImageModifier())
          }) //: button - spin
          
        } //: vstack - slots
        
        // MARK: - footer
        Spacer()
        HStack {
          
          // MARK: - bet 20
          HStack(alignment: .center, spacing: 10) {
            Button(action: {
              self.activeBet20()
            }, label: {
              Text("20")
                .fontWeight(.heavy)
                .foregroundColor(isActiveBet20 ? colorYellow : .white)
                .modifier(BetNumberModifier())
            }) //: button - bet 20
            .modifier(BetCapsuleModifier())
            
            Image(casinoChips)
              .resizable()
              .offset(x: isActiveBet20 ? 0 : 20)
              .opacity(isActiveBet20 ? 1 : 0)
              .modifier(CasinoChipsModifier())
          } //: hstack - bet 20
          
          Spacer()
          
          // MARK: - bet 10
          HStack(alignment: .center, spacing: 10) {
            Image(casinoChips)
              .resizable()
              .offset(x: isActiveBet10 ? 0 : -20)
              .opacity(isActiveBet10 ? 1 : 0)
              .modifier(CasinoChipsModifier())
            Button(action: {
              self.activeBet10()
            }, label: {
              Text("10")
                .fontWeight(.heavy)
                .foregroundColor(isActiveBet10 ? colorYellow : .white)
                .modifier(BetNumberModifier())
            }) //: button - bet 10
            .modifier(BetCapsuleModifier())
          } //: hstack - bet 10
          
        } //: hstack - footer
        
        
        
      } //: vstack - interface
      // MARK: - buttons
      .overlay(
        // reset
        Button(action: {
          self.resetGame()
        }, label: {
          Image(systemName: "arrow.2.circlepath.circle")
        })
        .modifier(ButtonModifier()),
        alignment: .topLeading
      )
      .overlay(
        // info
        Button(action: {
          self.showingInfoView = true
        }, label: {
          Image(systemName: "info.circle")
        })
        .modifier(ButtonModifier()),
        alignment: .topTrailing
      )
      .padding()
      .frame(maxWidth: 720)
      .blur(radius: $showPopup.wrappedValue ? 5 : 0, opaque: false)
      
      // MARK: - pop-up
      if ($showPopup.wrappedValue) {
        ZStack {
          Color(UIColor(colorTransparentBlack)).edgesIgnoringSafeArea(.all)
          
          VStack(spacing: 0) {
            Text("Game Over".uppercased())
              .font(.system(.title, design: .rounded))
              .fontWeight(.heavy)
              .padding()
              .frame(minWidth: 0, maxWidth: .infinity)
              .background(colorPink)
              .foregroundColor(.white)
            Spacer()
            
            VStack(alignment: .center, spacing: 16, content: {
              Image(sevenReel)
                .resizable()
                .scaledToFit()
                .frame(maxHeight: 72)
              
              Text("Too bad!! You're out of coins!!\nLet's play again")
                .font(.system(.body, design: .rounded))
                .lineLimit(2)
                .multilineTextAlignment(.center)
                .foregroundColor(.gray)
                .layoutPriority(1)
              
              Button(action: {
                self.showPopup = false
                self.coins = 100
                self.animatingPopup = false
                self.activeBet10()
              }, label: {
                Text("New Game".uppercased())
                  .font(.system(.body, design: .rounded))
                  .fontWeight(.semibold)
                  .accentColor(colorPink)
                  .padding(.horizontal, 12)
                  .padding(.vertical, 8)
                  .frame(minWidth: 128)
                  .background(
                    Capsule()
                      .strokeBorder(lineWidth: 1.75)
                      .foregroundColor(colorPink)
                  )
              })
            })
            Spacer()
            
          }
          .frame(minWidth: 280, idealWidth: 280, maxWidth: 320, minHeight: 260, idealHeight: 280, maxHeight: 320, alignment: .center)
          .background(.white)
          .cornerRadius(20)
          .shadow(color: colorTransparentBlack, radius: 6, x: 0, y: 8)
          .opacity($animatingPopup.wrappedValue ? 1 : 0)
          .offset(y: $animatingPopup.wrappedValue ? 0 : -100)
          .animation(.spring(response: 0.6, dampingFraction: 1.0, blendDuration: 1.0), value: animatingPopup)
          .onAppear(perform: {
            self.animatingPopup = true
          })
        }
      }
      
    } //: zstack
    .sheet(isPresented: $showingInfoView, content: { InfoView() })
    
  }
}

// MARK: - preview
struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView()
      .previewInterfaceOrientation(.portrait)
  }
}
