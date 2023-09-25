//
//  CounterViewModel.swift
//  Zikirin Counter
//
//  Created by Hafizh Mo on 20/09/23.
//

import SwiftUI
import FirebaseDatabase
import FirebaseDatabaseSwift

class CounterViewModel: ObservableObject {
  @Binding private var total: Int
  @Published var isPresentedSettings = false
  @Published var isPresentedZikirList = false
  
  @Published var zikirList: [Zikir] = []
  @Published var selectedTab = 0
  @Published var progress = 0
  
  private let ref = Database.database().reference()
  
  init(total: Binding<Int>) {
    self._total = total
    self.zikirList = [
      Zikir(title: "Istigfar", verse: "", romanized: "Astaghfirullah Al Adzim", repetition: 33),
      Zikir(title: "Tasbih", verse: "", romanized: "Subhaanal malikil qudduus", repetition: 33),
      Zikir(title: "Tahmid", verse: "", romanized: "Alhamdulillah", repetition: 33),
      Zikir(title: "Takbir", verse: "", romanized: "Allahu akbar", repetition: 5),
      Zikir(title: "Tahlil", verse: "", romanized: "Laailaaha Illallah", repetition: 33),
      Zikir(title: "Salawat", verse: "", romanized: "Allahumma sholli ‘ala Muhammad", repetition: 100)
    ]
  }
  
  func updateZikirTotal() {
    let value = total + 1
    ref.child("zikirTotal").setValue(value)
  }
}
