//
//  CounterTabBar.swift
//  Zikirin Counter
//
//  Created by Hafizh Mo on 24/09/23.
//

import SwiftUI

struct CounterTabBar: View {
  private var names: [String] = ["Tab 1", "Tab 2", "Tab 3", "Tab 4", "Tab 5", "Tab 6", "Tab 7", "Tab 8", "Tab 9", "Tab 1000"]
  
  @State var selectedIndex = 0
  @Namespace private var menuItemTransition
  
  var body: some View {
    ScrollViewReader { scrollView in
      ScrollView(.horizontal, showsIndicators: false) {
        HStack(alignment: .firstTextBaseline) {
          ForEach(names.indices, id: \.self) { index in
            AppCodaTabItem(name: names[index], isActive: selectedIndex == index, namespace: menuItemTransition)
              .padding(.leading, index == 0 ? 20 : 0)
              .onTapGesture {
                withAnimation(.easeInOut) {
                  selectedIndex = index
                }
              }
          }
        }
      }
      .onChange(of: selectedIndex) { index in
        withAnimation {
          scrollView.scrollTo(index, anchor: .center)
        }
      }
    }
  }
}

struct AppCodaTabItem: View {
  var name: String
  var isActive: Bool = false
  let namespace: Namespace.ID
  
  var body: some View {
    if isActive {
      Text(name)
        .bold()
        .font(.title3)
        .padding(.vertical, 8)
        .foregroundColor(.textPrimary)
        .border(width: 1, edges: [.bottom], color: .textPrimary)
        .matchedGeometryEffect(id: "highlightmenuitem", in: namespace)
    } else {
      Text(name)
        .font(.subheadline)
        .padding(8)
        .foregroundColor(.textPrimary.opacity(0.5))
    }
    
  }
}

struct CounterTabBar_Previews: PreviewProvider {
  static var previews: some View {
    CounterTabBar()
  }
}
