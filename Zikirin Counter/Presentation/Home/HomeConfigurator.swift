//
//  HomeConfigurator.swift
//  Zikirin Counter
//
//  Created by Hafizh Mo on 20/09/23.
//

import Foundation

final class HomeConfigurator {
  public static func configureHomeView(with viewModel: HomeViewModel = HomeViewModel()) -> HomeView {
    return HomeView(viewModel: viewModel)
  }
}
