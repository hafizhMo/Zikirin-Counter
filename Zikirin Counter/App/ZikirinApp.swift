//
//  ZikirinApp.swift
//  Zikirin Counter
//
//  Created by Hafizh Mo on 17/09/23.
//

import SwiftUI
import Firebase

@main
struct ZikirinApp: App {
  init() {
    FirebaseApp.configure()
  }
  
  var body: some Scene {
    WindowGroup {
      HomeConfigurator.configureHomeView()
    }
  }
}
