//
//  ZikirListConfigurator.swift
//  Zikirin Counter
//
//  Created by Hafizh Mo on 25/09/23.
//

import Foundation

final class ZikirListConfigurator {
  
  public static func configureZikirList(with list: [Zikir]) -> ZikirListView {
    let viewModel = ZikirListViewModel(list: list)
    let zikirListView = ZikirListView(viewModel: viewModel)
    return zikirListView
  }
}
