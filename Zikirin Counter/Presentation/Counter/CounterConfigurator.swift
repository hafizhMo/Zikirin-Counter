//
//  CounterConfigurator.swift
//  Zikirin Counter
//
//  Created by Hafizh Mo on 20/09/23.
//

import SwiftUI

final class CounterConfigurator {
  public static func configureCounterView(with total: Binding<Int>) -> CounterView {
    let counterView = CounterView(viewModel: CounterViewModel(total: total))
    return counterView
  }
}
