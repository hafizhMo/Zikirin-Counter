//
//  ContentView.swift
//  Zikirin Counter
//
//  Created by Hafizh Mo on 17/09/23.
//

import SwiftUI

struct HomeView: View {
  var body: some View {
    TabView {
      CounterView()
        .tabItem {
          Label("Counter", systemImage: "deskclock")
        }
      SummaryView()
        .tabItem {
          Label("World", systemImage: "globe")
        }
    }
  }
}

struct HomeView_Previews: PreviewProvider {
  static var previews: some View {
    HomeView()
  }
}
