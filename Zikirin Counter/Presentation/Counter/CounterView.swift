//
//  CounterView.swift
//  Zikirin Counter
//
//  Created by Hafizh Mo on 18/09/23.
//

import SwiftUI
import Combine

struct CounterView: View {
  @ObservedObject var viewModel: CounterViewModel
  
  var body: some View {
    ZStack {
      Color.backgroundPrimary.ignoresSafeArea()
      countingButton()
        .padding(.vertical, 150)
      VStack {
        toolbarButton()
        zikirDetail()
        Spacer()
      }
    }
  }
  
  private func countingButton() -> some View {
    Button {
//      viewModel.updateZikirTotal()
      viewModel.progress += 1
    } label: {
      VStack {
        Text(viewModel.progress.description)
          .font(.system(size: 72, weight: .bold))
          .padding(.vertical, 8)
          .border(width: 4, edges: [.bottom], color: .textPrimary)
        Text(viewModel.zikirList[viewModel.selectedTab].repetition.description)
          .font(.system(size: 32, weight: .medium))
      }
      .foregroundColor(.textPrimary)
      .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
  }
  
  private func toolbarButton() -> some View {
    HStack(alignment: .bottom, spacing: 12) {
      CounterTabBar(titles: viewModel.zikirList.map { $0.title }, selected: $viewModel.selectedTab)
      
      Button {
        viewModel.isPresentedZikirList = true
      } label: {
        HStack {
          Image(systemName: "magnifyingglass")
        }
        .foregroundColor(.textPrimary)
        .padding(.vertical, 8)
        .border(width: 1, edges: [.bottom], color: .textPrimary)
      }
      .sheet(isPresented: $viewModel.isPresentedZikirList) {
        CounterRouter.destinationToZikirListView(list: viewModel.zikirList)
      }
      
      Button {
        viewModel.isPresentedSettings = true
      } label: {
        HStack {
          Image(systemName: "gear")
        }
        .foregroundColor(.textPrimary)
        .padding(.vertical, 8)
        .border(width: 1, edges: [.bottom], color: .textPrimary)
      }
      .sheet(isPresented: $viewModel.isPresentedSettings) {
        CounterRouter.destinationToSettingsView()
      }
    }
    .padding(.trailing)
  }
  
  private func zikirDetail() -> some View {
    VStack(spacing: 8) {
      Text(viewModel.zikirList[viewModel.selectedTab].verse)
        .bold()
        .font(.title)
        .foregroundColor(.textPrimary)
      Text(viewModel.zikirList[viewModel.selectedTab].romanized)
        .font(.title3)
        .foregroundColor(.textPrimary)
    }
    .padding(.vertical)
  }
}

struct CounterView_Previews: PreviewProvider {
  static var previews: some View {
    CounterView(viewModel: CounterViewModel(total: .constant(0)))
  }
}
