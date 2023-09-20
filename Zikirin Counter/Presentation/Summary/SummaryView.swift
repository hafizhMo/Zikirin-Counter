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
      Color.gray.opacity(0.05).ignoresSafeArea()
      VStack(spacing: 0) {
        publicZikirCard()
      }
    }
  }
  
  private func publicZikirCard() -> some View {
    ZStack {
      Rectangle()
        .foregroundColor(.black.opacity(0.85))
        .frame(maxWidth: .infinity)
        .cornerRadius(20)
        .shadow(color: Color.black.opacity(0.1), radius: 12, x: 1, y: 1)
        .padding()
      VStack(alignment: .trailing, spacing: 20) {
          VStack(alignment: .trailing, spacing: -8) {
            Text("200+")
              .foregroundColor(.mint.opacity(0.6))
              .font(.system(size: 48, weight: .heavy))
            Text("Dhikr Than Yesterday".uppercased())
              .foregroundColor(.mint.opacity(0.6))
              .bold()
              .font(.caption)
              .foregroundColor(.primary.opacity(0.7))
          }
          VStack(alignment: .trailing, spacing: -8) {
            Text("\(viewModel.total)K")
              .foregroundColor(.white.opacity(0.9))
              .font(.system(size: 72, weight: .heavy))
            Text("Dhikr already read around the world".uppercased())
              .foregroundColor(.white.opacity(0.9))
              .bold()
              .font(.caption)
              .foregroundColor(.primary.opacity(0.7))
          }
          VStack(alignment: .trailing, spacing: -8) {
            Text("87")
              .foregroundColor(.mint.opacity(0.6))
              .font(.system(size: 48, weight: .heavy))
            Text("Total Zikir You read Today".uppercased())
              .foregroundColor(.mint.opacity(0.6))
              .bold()
              .font(.caption)
              .foregroundColor(.primary.opacity(0.7))
          }
      }
      .padding()
      .padding(.horizontal)
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
