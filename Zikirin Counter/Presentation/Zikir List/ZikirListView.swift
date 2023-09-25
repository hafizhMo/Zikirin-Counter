//
//  ZikirListView.swift
//  Zikirin Counter
//
//  Created by Hafizh Mo on 25/09/23.
//

import SwiftUI

struct ZikirListView: View {
  var viewModel: ZikirListViewModel
  
  var body: some View {
    List(viewModel.list) { zikir in
      Text(zikir.title)
    }
  }
}

struct ZikirListView_Previews: PreviewProvider {
  static var previews: some View {
    ZikirListView(viewModel: ZikirListViewModel(list: []))
  }
}
