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
    VStack {
      if viewModel.total != nil {
        Text(viewModel.total!)
          .bold()
          .font(.largeTitle)
      } else {
        Text("Fetching value...")
          .padding()
          .background(.gray)
      }
    }
    .onAppear {
      viewModel.observeTotal()
    }
  }
}

struct PublicTotalView_Previews: PreviewProvider {
  static var previews: some View {
    PublicTotalView()
  }
}
