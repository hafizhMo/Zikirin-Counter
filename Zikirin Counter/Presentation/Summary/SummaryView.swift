//
//  PublicTotal.swift
//  Zikirin Counter
//
//  Created by Hafizh Mo on 18/09/23.
//

import SwiftUI

struct SummaryView: View {
  @ObservedObject var viewModel: SummaryViewModel
  
  var body: some View {
    ZStack {
      Color.black.opacity(0.85).ignoresSafeArea()
      publicZikirCard()
      statisticButton()
    }
  }
  
  private func publicZikirCard() -> some View {
    HStack {
      Spacer()
      VStack(alignment: .trailing, spacing: 20) {
        VStack(alignment: .trailing, spacing: -8) {
          Text("200")
            .foregroundColor(.mint.opacity(0.6))
            .font(.system(size: 48, weight: .heavy))
          Text("Your Yesterday Zikir".uppercased())
            .foregroundColor(.mint.opacity(0.6))
            .bold()
            .font(.caption)
            .foregroundColor(.primary.opacity(0.7))
        }
        
        VStack(alignment: .trailing, spacing: -8) {
          Text("\(viewModel.total)K")
            .foregroundColor(.white.opacity(0.9))
            .font(.system(size: 72, weight: .heavy))
          Text("Total Zikir Overseas".uppercased())
            .foregroundColor(.white.opacity(0.9))
            .bold()
            .font(.caption)
            .foregroundColor(.primary.opacity(0.7))
        }
        
        VStack(alignment: .trailing, spacing: -8) {
          Text("87")
            .foregroundColor(.mint.opacity(0.6))
            .font(.system(size: 48, weight: .heavy))
          Text("Your Today Zikir".uppercased())
            .foregroundColor(.mint.opacity(0.6))
            .bold()
            .font(.caption)
            .foregroundColor(.primary.opacity(0.7))
        }
      }
    }
    .padding(28)
    .padding(.bottom, 72)
  }
  
  private func statisticButton() -> some View {
    VStack {
      Button {
        viewModel.isPresented = true
      } label: {
        HStack {
          Text("See Detail Statistics")
          Image(systemName: "chart.xyaxis.line")
        }
        .foregroundColor(.white)
        .padding(.vertical, 8)
        .padding(.top)
        .border(width: 1, edges: [.bottom], color: .white)
      }
      .sheet(isPresented: $viewModel.isPresented) {
        SummaryRouter.destinationToStatisticsView()
      }
      Spacer()
    }
  }
  
  private func otherCard() -> some View {
    ZStack {
      Rectangle()
        .foregroundColor(.white)
        .frame(maxWidth: .infinity)
        .cornerRadius(20)
        .shadow(color: Color.black.opacity(0.1), radius: 12, x: 1, y: 1)
        .padding(.horizontal)
    }
  }
}

struct SummaryView_Previews: PreviewProvider {
  static var previews: some View {
    SummaryView(viewModel: SummaryViewModel(total: .constant(0)))
  }
}
