//
//  SwiftUIChatTutorialApp.swift
//  SwiftUIChatTutorial
//
//  Created by admin on 5/9/21.
//

import SwiftUI
import Firebase

@main
struct SwiftUIChatTutorialApp: App {
  
  init() {
    FirebaseApp.configure()
  }
  
    var body: some Scene {
        WindowGroup {
          ContentView().environmentObject(AuthViewModel.shared)
        }
    }
}
