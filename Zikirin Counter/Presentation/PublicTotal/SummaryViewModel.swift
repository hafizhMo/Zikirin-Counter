//
//  PublicTotalViewModel.swift
//  Zikirin Counter
//
//  Created by Hafizh Mo on 18/09/23.
//

import Foundation
import FirebaseDatabase
import FirebaseDatabaseSwift

class SummaryViewModel: ObservableObject {
  private var ref = Database.database().reference()
  @Published var total: String? = nil
  
  func readTotal() {
    ref.child("zikirTotal").observeSingleEvent(of: .value) { [weak self] snapshot in
      guard let self = self, let totalInteger = snapshot.value as? Int else { return }
      self.total = String(totalInteger)
    }
  }
  
  func observeTotal() {
    ref.child("zikirTotal").observe(.value) { [weak self] snapshot in
      guard let self = self, let totalInteger = snapshot.value as? Int else { return }
      self.total = String(totalInteger)
    }
  }
}
