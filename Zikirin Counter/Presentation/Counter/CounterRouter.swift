//
//  CounterRouter.swift
//  Zikirin Counter
//
//  Created by Hafizh Mo on 22/09/23.
//

import SwiftUI

final class CounterRouter {
  public static func destinationToSettingsView() -> some View {
    return SettingsConfigurator.configureSettingsView()
  }
  
  public static func destinationToFreeRunFormView() -> some View {
    return FreeRunFormConfigurator.configureFreeRunFormView()
  }
  
  public static func destinationToZikirListView(list: [Zikir]) -> some View {
    return ZikirListConfigurator.configureZikirList(with: list)
  }
}
