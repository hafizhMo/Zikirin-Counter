//
//  HomeViewModel.swift
//  Zikirin Counter
//
//  Created by Hafizh Mo on 20/09/23.
//

import FirebaseDatabase
import FirebaseDatabaseSwift

class HomeViewModel: ObservableObject {
  @Published var total: Int = 0
  @Published var activeView: Int = 0
  
  private var ref = Database.database().reference()
  
  public func onAppear() {
    ref.child("zikirTotal").observe(.value) { [weak self] snapshot in
      guard let self = self, let total = snapshot.value as? Int else { return }
      self.total = total
    }
  }
}
