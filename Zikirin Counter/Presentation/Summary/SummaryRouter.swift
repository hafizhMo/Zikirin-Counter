//
//  SummaryRouter.swift
//  Zikirin Counter
//
//  Created by Hafizh Mo on 22/09/23.
//

import SwiftUI

final class SummaryRouter {
  public static func destinationToStatisticsView() -> some View {
    return StatisticsConfigurator.configureStatisticsView()
  }
}
