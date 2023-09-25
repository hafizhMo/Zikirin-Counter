//
//  CounterTabBar.swift
//  Zikirin Counter
//
//  Created by Hafizh Mo on 24/09/23.
//

import SwiftUI

struct CounterTabBar: View {
  var titles: [String]
  
  @Binding var selected: Int
  @Namespace private var namespace
  
  var body: some View {
    ScrollViewReader { scrollView in
      ScrollView(.horizontal, showsIndicators: false) {
        HStack(alignment: .firstTextBaseline) {
          ForEach(titles.indices, id: \.self) { index in
            CounterTabItem(title: titles[index], isActive: selected == index, namespace: namespace)
              .padding(.leading, index == 0 ? 20 : 0)
              .onTapGesture {
                withAnimation(.easeInOut) {
                  selected = index
                }
              }
          }
        }
      }
      .onChange(of: selected) { index in
        withAnimation {
          scrollView.scrollTo(index, anchor: .center)
        }
      }
    }
  }
}

struct CounterTabItem: View {
  var title: String
  var isActive: Bool = false
  let namespace: Namespace.ID
  
  var body: some View {
    if isActive {
      Text(title)
        .bold()
        .font(.title3)
        .padding(.vertical, 8)
        .foregroundColor(.textPrimary)
        .border(width: 1, edges: [.bottom], color: .textPrimary)
        .matchedGeometryEffect(id: "highlightmenuitem", in: namespace)
    } else {
      Text(title)
        .font(.subheadline)
        .padding(8)
        .foregroundColor(.textPrimary.opacity(0.5))
    }
    
  }
}

struct CounterTabBar_Previews: PreviewProvider {
  static var previews: some View {
    CounterTabBar(titles: [], selected: .constant(0))
  }
}
