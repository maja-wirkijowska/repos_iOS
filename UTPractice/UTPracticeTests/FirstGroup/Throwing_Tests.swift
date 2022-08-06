//
//  Throwing_Tests.swift
//  UTPracticeTests
//
//  Created by Maja Wirkijowska on 7/26/22.
//

import XCTest

enum GameError: LocalizedError {
  case notPurchased
  case notInstalled
  case parentControlsDisallowed
}

extension LocalizedError {
  var errorDescription: String? {
    return"\(self)"
  }
}

struct Game {
  let name: String
  
  func play() throws {
    if name == "BioBlitz" {
      throw GameError.notPurchased
    } else if name == "Blastazap" {
      throw GameError.notInstalled
    } else if name == "Dead Storm Rising" {
      throw GameError.parentControlsDisallowed
    } else {
      print("\(name) is OK to play")
    }
  }
}

class Throwing_Tests: XCTestCase {

  func test_playingBioBlitzThrows() {
    let game = Game(name: "BioBlitz")
    do {
      try game.play()
      XCTFail("BioBlitz has not be purchased")
    } catch {}
  }
  
  func test_playingBioBlitzThrows_Better() {
    let game = Game(name: "BioBlitz")
    do {
      try game.play()
      XCTFail()
    } catch GameError.notPurchased {
      print("Success")
    } catch {
      XCTFail()
    }
  }
  
  func test_playingBioBlitzThrows_Better2() {
    let game = Game(name: "Blastazap")
    XCTAssertThrowsError(try game.play())
  }
  
  func test_playingBioBlitzThrows_Better3() {
    let game = Game(name: "Blastazap")
    
    XCTAssertThrowsError(try game.play()) { error in
      XCTAssertEqual(error as? GameError, GameError.notInstalled)
    }
  }
  
  func test_playExplodingMonkeysDoesNotThrow() {
    let game = Game(name: "Exploding Monkeys")
    XCTAssertNoThrow(try game.play())
  }
  
  func test_deadStormRisingThrows() throws {
    let game = Game(name: "CrashyPlane")
    try game.play()
  }

}
