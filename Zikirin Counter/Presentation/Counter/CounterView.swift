//
//  CounterView.swift
//  Zikirin Counter
//
//  Created by Hafizh Mo on 18/09/23.
//

import SwiftUI

struct CounterView: View {
  @ObservedObject var viewModel: CounterViewModel
  
  var body: some View {
    ZStack {
      Color.backgroundPrimary.ignoresSafeArea()
      VStack {
        statisticButton()
        countingButton()
      }
    }
  }
  
  private func countingButton() -> some View {
    Button {
      viewModel.updateZikirTotal()
    } label: {
      VStack {
        Text("+1")
          .font(.system(size: 72, weight: .bold))
          .padding(.vertical, 8)
          .border(width: 4, edges: [.bottom], color: .textPrimary)
        Text("33")
          .font(.system(size: 32, weight: .medium))
      }
      .foregroundColor(.textPrimary)
      .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
  }
  
  private func statisticButton() -> some View {
    VStack {
      HStack(spacing: 12) {
        Spacer()
        Button {
          viewModel.isPresentedFreeRunForm = true
        } label: {
          HStack {
            Image(systemName: "magnifyingglass")
          }
          .foregroundColor(.textPrimary)
          .padding(.vertical, 8)
          .border(width: 1, edges: [.bottom], color: .textPrimary)
        }
        .sheet(isPresented: $viewModel.isPresentedFreeRunForm) {
          CounterRouter.destinationToFreeRunFormView()
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
  }
}

struct CounterView_Previews: PreviewProvider {
  static var previews: some View {
    CounterView(viewModel: CounterViewModel(total: .constant(0)))
  }
}
