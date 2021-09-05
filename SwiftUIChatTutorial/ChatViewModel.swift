//
//  ChatViewModel.swift
//  SwiftUIChatTutorial
//
//  Created by admin on 4/9/21.
//

import Foundation

class ChatViewModel: ObservableObject {
  
  @Published var messages = [Message]()
  
  init() {
    self.messages = mockMessages
  }
  
  var mockMessages: [Message] {
    [
      .init(isFromCurrentUser: true, messageText: "Hey there"),
      .init(isFromCurrentUser: false, messageText: "Hey there 343"),
      .init(isFromCurrentUser: true, messageText: "Hey there YTRK"),
      .init(isFromCurrentUser: true, messageText: "Hey there JHJ "),
      .init(isFromCurrentUser: false, messageText: "Hey there fdjsh"),
      .init(isFromCurrentUser: true, messageText: "Hey there HYUYO"),
      .init(isFromCurrentUser: true, messageText: "Hey there HJHHJ"),
      
    ]
  }
  
  func sendMessage(_ messageText: String) {
    let message = Message(isFromCurrentUser: true, messageText: messageText)
    
    messages.append(message)
    
  }
  
}
