//
//  PublicTotal.swift
//  Zikirin Counter
//
//  Created by Hafizh Mo on 18/09/23.
//

import SwiftUI

struct PublicTotalView: View {
  @StateObject var viewModel = ViewModel()
  
  var body: some View {
    ZStack {
      Color.gray.opacity(0.05).ignoresSafeArea()
      VStack(spacing: 0) {
        publicZikirCard()
        otherCard()
        Spacer()
      }
    }
    .onAppear {
      viewModel.observeTotal()
    }
  }
  
  private func publicZikirCard() -> some View {
    ZStack {
      Rectangle()
        .foregroundColor(.white)
        .frame(maxWidth: .infinity, maxHeight: 250)
        .cornerRadius(20)
        .shadow(color: Color.black.opacity(0.1), radius: 12, x: 1, y: 1)
        .padding()
      VStack(alignment: .leading) {
        if viewModel.total != nil {
          Text("Total Zikir Around the World".uppercased())
            .bold()
            .font(.caption)
            .foregroundColor(.primary.opacity(0.5))
          HStack(alignment: .firstTextBaseline) {
            Text(viewModel.total!)
              .font(.system(size: 72, weight: .heavy))
            Text("X")
              .font(.system(size: 32, weight: .black))
            Spacer()
          }
        } else {
          Text("Fetching value...")
            .padding()
            .background(.gray)
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

struct PublicTotalView_Previews: PreviewProvider {
  static var previews: some View {
    PublicTotalView()
  }
}
