//
//  CounterViewModel.swift
//  Zikirin Counter
//
//  Created by Hafizh Mo on 20/09/23.
//

import FirebaseDatabase
import FirebaseDatabaseSwift

class CounterViewModel: ObservableObject {
  
  private let ref = Database.database().reference()
  private var total: Int = 0
  
  init() {
    ref.child("zikirTotal").observe(.value) { [weak self] snapshot in
      guard let self = self, let total = snapshot.value as? Int else { return }
      self.total = total
    }
  }
  
  func updateZikirTotal() {
    ref.child("zikirTotal").setValue(total + 1)
  }
}
