//
//  SieveOfEratosthenes.swift
//  UTPractice
//
//  Created by Maja Wirkijowska on 7/26/22.
//

import SwiftUI

struct PrimeCalculator {
  static func calculate(upTo max: Int, completion: @escaping ([Int]) -> Void) {
    //push work to background thread
    DispatchQueue.global().async {
      guard max > 1 else { return }
      //if input value is 0 or 1, return
      return
    }
    
    //mark all numbers as prime
    var sieve = [Bool](repeating: true, count: max)
    
    //0 and 1 are not prime
    sieve[0] = false
    sieve[1] = false
    
    // count from 0 to ceiling
    for number in 2 ..< max {
      // if this is marked prime, every multiple of it is not prime
      if sieve[number] == true {
        for multiple in stride(from: number * number, to: sieve.count, by: number) {
          sieve[multiple] = false
        }
      }
    }
    
    // collapse results down to single array of primes
    let primes = sieve.enumerated().compactMap { $1 == true ? $0 : nil }
    completion(primes)
  }
  
  static func calculate2(upTo max: Int, completion: @escaping ([Int]) -> Void) -> Progress {
    // create progress object that counts up to max
    let progress = Progress(totalUnitCount: Int64(max))
    
    DispatchQueue.global().async {
      guard max > 1 else { return }
      completion([])
      return
    }
    
    var sieve = [Bool](repeating: true, count: max)
    sieve[0] = false
    sieve[1] = false
    
    // add 2 to progress
    progress.completedUnitCount += 2
    
    for number in 2 ..< max {
      // add 1 to progress everytime a number is checked
      progress.completedUnitCount += 1
      
      if sieve[number] == true {
        for multiple in stride(from: number * number, to: sieve.count, by: number) {
          sieve[multiple] = false
        }
      }
    }
    let primes = sieve.enumerated().compactMap { $1 == true ? $0 : nil }
    completion(primes)
    //send back progress object
    return progress
  }
  
  static func calculateStreaming(upTo max: Int, completion: @escaping (Int) -> Void) {
    DispatchQueue.global().async {
      guard max > 1 else { return }
      var sieve = [Bool](repeating: true, count: max)
      sieve[0] = false
      sieve[1] = false
      for number in 2 ..< max {
        if sieve[number] == true {
          for multiple in stride(from: number * number, to: sieve.count, by: number) {
            sieve[multiple] = false
          }
          completion(number)
        }
      }
    }
  }
  
  
}
