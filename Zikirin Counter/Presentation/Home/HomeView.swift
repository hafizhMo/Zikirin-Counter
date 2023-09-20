//
//  ContentView.swift
//  Zikirin Counter
//
//  Created by Hafizh Mo on 17/09/23.
//

import SwiftUI

struct HomeView: View {
  @ObservedObject var viewModel: HomeViewModel
  
  var body: some View {
    NavigationView {
      VStack {
        if viewModel.activeView == 0 {
          HomeRouter.displayForCounterTabView(total: $viewModel.total)
            .frame(maxHeight: .infinity)
        } else {
          HomeRouter.displayForSummaryTabView(total: $viewModel.total)
        }
        
        HStack {
          Button {
            viewModel.activeView = 0
          } label: {
            Text("Counter")
              .bold()
              .font(.title)
              .foregroundColor(.primary.opacity(viewModel.activeView == 0 ? 1 : 0.5))
          }
          .disabled(viewModel.activeView == 0)
          .frame(maxWidth: .infinity)
          
          Button {
            viewModel.activeView = 1
          } label: {
            Text("Summary")
              .bold()
              .font(.title)
              .foregroundColor(.primary.opacity(viewModel.activeView == 1 ? 1 : 0.5))
          }
          .disabled(viewModel.activeView == 1)
          .frame(maxWidth: .infinity)
        }
      }
      .onAppear {
        viewModel.onAppear()
      }
    }
  }
}

struct HomeView_Previews: PreviewProvider {
  static var previews: some View {
    HomeView(viewModel: HomeViewModel())
  }
}
