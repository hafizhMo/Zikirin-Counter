//
//  HomeRouter.swift
//  Zikirin Counter
//
//  Created by Hafizh Mo on 20/09/23.
//

import SwiftUI

final class HomeRouter {
  public static func displayForCounterTabView(total: Binding<Int>) -> some View {
    return CounterConfigurator.configureCounterView(with: total)
  }
  
  public static func displayForSummaryTabView(total: Binding<Int>) -> some View {
    return SummaryConfigurator.configureSummaryView(with: total)
  }
}
