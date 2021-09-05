//
//  MainTabView.swift
//  MainTabView
//
//  Created by admin on 7/8/21.
//

import SwiftUI

struct MainTabView: View {
  
  @State private var selectedIndex = 0
  
  var body: some View {
    NavigationView {
      TabView(selection: $selectedIndex) {
        ConversationsView()
          .onTapGesture {
            selectedIndex = 0
            print("selected index \(selectedIndex)")
          }
          .tabItem {
            Image(systemName: "bubble.left")
          }
          .tag(0)
        ChannelsView()
          .onTapGesture {
            selectedIndex = 1
            print("selected index \(selectedIndex)")
          }
          .tabItem {
            Image(systemName: "bubble.left.and.bubble.right")
          }
          .tag(1)
        SettingsView()
          .onTapGesture {
            selectedIndex = 2
            print("selected index \(selectedIndex)")
          }
          .tabItem {
            Image(systemName: "gear")
          }
          .tag(2)
          
      }
      .navigationTitle(tabTitle)
    }
  }
  
  var tabTitle: String {
    switch selectedIndex {
    case 0: return "Chats"
    case 1: return "Channels"
    case 2: return "Settings"
      
    default: return ""
    }
  }
  
}
//
struct MainTabView_Previews: PreviewProvider {
  static var previews: some View {
    MainTabView()
  }
}
