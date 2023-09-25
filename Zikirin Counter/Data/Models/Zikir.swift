//
//  Zikir.swift
//  Zikirin Counter
//
//  Created by Hafizh Mo on 25/09/23.
//

import Foundation

struct Zikir: Identifiable, Hashable, Equatable {
  let id = UUID()
  var title: String
  var verse: String
  var romanized: String
  var repetition: Int
}

extension Zikir {
  static func fake() -> Self {
    return Zikir(title: "Tasbih", verse: "", romanized: "", repetition: 0)
  }
}
