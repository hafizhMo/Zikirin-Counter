//
//  CounterConfigurator.swift
//  Zikirin Counter
//
//  Created by Hafizh Mo on 20/09/23.
//

import SwiftUI

final class CounterConfigurator {
  public static func configureCounterView(with total: Binding<Int>) -> CounterView {
    let viewModel = CounterViewModel(total: total)
    return CounterView(viewModel: viewModel)
  }
}
