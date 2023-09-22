//
//  PublicTotalViewModel.swift
//  Zikirin Counter
//
//  Created by Hafizh Mo on 18/09/23.
//

import SwiftUI
import FirebaseDatabase
import FirebaseDatabaseSwift

class SummaryViewModel: ObservableObject {
  @Published var isPresented = false
  @Binding var total: Int
  
  init(total: Binding<Int>) {
    self._total = total
  }
}
