//
//  SummaryConfigurator.swift
//  Zikirin Counter
//
//  Created by Hafizh Mo on 20/09/23.
//

import SwiftUI

final class SummaryConfigurator {
  public static func configureSummaryView(with total: Binding<Int>) -> SummaryView {
    let viewModel = SummaryViewModel(total: total)
    return SummaryView(viewModel: viewModel)
  }
}
