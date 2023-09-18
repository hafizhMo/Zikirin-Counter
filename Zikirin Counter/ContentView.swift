//
//  ContentView.swift
//  Zikirin Counter
//
//  Created by Hafizh Mo on 17/09/23.
//

import SwiftUI

struct ContentView: View {
  var body: some View {
    TabView {
      CounterView()
        .tabItem {
          Label("Counter", systemImage: "deskclock")
        }
      PublicTotalView()
        .tabItem {
          Label("World", systemImage: "globe")
        }
    }
  }
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView()
  }
}
