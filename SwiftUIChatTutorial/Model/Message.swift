//
//  Message.swift
//  SwiftUIChatTutorial
//
//  Created by admin on 4/9/21.
//

import Foundation

struct Message: Identifiable {
  let id = NSUUID().uuidString
  let isFromCurrentUser: Bool
  let messageText: String
  
}
