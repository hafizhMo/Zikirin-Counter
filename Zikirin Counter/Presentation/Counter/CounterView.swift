//
//  CounterView.swift
//  Zikirin Counter
//
//  Created by Hafizh Mo on 18/09/23.
//

import SwiftUI

struct CounterView: View {
  @ObservedObject var viewModel: CounterViewModel
  
  var body: some View {
    VStack {
      Button {
        viewModel.updateZikirTotal()
      } label: {
        Text("+1")
          .padding(.horizontal)
          .padding(.vertical, 8)
          .background(.regularMaterial)
      }
    }
  }
}

struct CounterView_Previews: PreviewProvider {
  static var previews: some View {
    CounterView(viewModel: CounterViewModel(total: .constant(0)))
  }
}
