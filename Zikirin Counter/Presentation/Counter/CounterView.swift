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
    VStack {
      statisticButton()
      countingButton()
    }
  }
  
  private func countingButton() -> some View {
    VStack(spacing: 20) {
      Button {
        viewModel.updateZikirTotal()
      } label: {
        Text("+1")
          .frame(maxWidth: .infinity, maxHeight: .infinity)
          .background(.regularMaterial)
      }
      Text("Tap the screen to start counting")
        .font(.caption)
        .foregroundColor(.primary.opacity(0.7))
    }
  }
  
  private func statisticButton() -> some View {
    VStack {
      HStack {
        Spacer()
        Button {
          viewModel.isPresentedFreeRunForm = true
        } label: {
          HStack {
            Text("Edit")
            Image(systemName: "pencil")
          }
          .foregroundColor(.blue)
          .padding()
          .background(.regularMaterial)
          .cornerRadius(8)
        }
        .sheet(isPresented: $viewModel.isPresentedFreeRunForm) {
          CounterRouter.destinationToFreeRunFormView()
        }
        
        Button {
          viewModel.isPresentedSettings = true
        } label: {
          HStack {
            Text("Settings")
            Image(systemName: "gear")
          }
          .foregroundColor(.blue)
          .padding()
          .background(.regularMaterial)
          .cornerRadius(8)
        }
        .sheet(isPresented: $viewModel.isPresentedSettings) {
          CounterRouter.destinationToSettingsView()
        }
      }
      .padding(.trailing, 32)
    }
  }
}

struct CounterView_Previews: PreviewProvider {
  static var previews: some View {
    CounterView(viewModel: CounterViewModel(total: .constant(0)))
  }
}
