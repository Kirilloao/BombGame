//
//  UserDefaults.swift
//  BombGame
//
//  Created by Александра Савчук on 11.08.2023.
//

import Foundation

struct UserDefaultsManager {
  let defaults = UserDefaults.standard
  static var shared = UserDefaultsManager()

    private let defaultFonMusic = "fon1"
    private let defaultTimerMusic = "timer1"
    private let defaultExplosionMusic = "explosion1"

    var fonMusic: String {
        get {
            return defaults.string(forKey: "fonMusic") ?? defaultFonMusic
        }
        set {
          defaults.set(newValue, forKey: "fonMusic")
          defaults.synchronize()
        }
    }

    var timerMusic: String {
        get {
            return defaults.string(forKey: "timerMusic") ?? defaultTimerMusic
        }
        set {
          defaults.set(newValue, forKey: "timerMusic")
          defaults.synchronize()
        }
    }

    var explosionMusic: String {
        get {
            return defaults.string(forKey: "explosionMusic") ?? defaultExplosionMusic
        }
        set {
          defaults.set(newValue, forKey: "explosionMusic")
          defaults.synchronize()
        }
    }

  var selectedCategories: [String] {
          get {
              return defaults.array(forKey: "selectedCategories") as? [String] ?? []
          }
          set {
              defaults.set(newValue, forKey: "selectedCategories")
              defaults.synchronize()
          }
      }
  
}

