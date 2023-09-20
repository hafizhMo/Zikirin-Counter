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
  private let ref = Database.database().reference()
  
  init(total: Binding<Int>) {
    self._total = total
  }
  
  func updateZikirTotal() {
    let value = total + 1
    ref.child("zikirTotal").setValue(value)
  }
}
