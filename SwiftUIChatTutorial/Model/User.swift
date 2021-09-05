//
//  User.swift
//  SwiftUIChatTutorial
//
//  Created by admin on 5/9/21.
//

import SwiftUI
import Firebase

struct User: Identifiable {
  let id: String = UUID().uuidString
  let email: String
  let username: String
  let fullname: String
  let profileImageUrl: String
}
