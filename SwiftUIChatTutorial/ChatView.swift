//
//  ChatView.swift
//  ChatView
//
//  Created by admin on 7/8/21.
//

import SwiftUI

struct ChatView: View {
  
  @State var messageText: String = ""
  
  @ObservedObject var viewModel = ChatViewModel()
  
    var body: some View {
      VStack {
        ScrollView {
          VStack(alignment: .leading, spacing: 12) {
            
            ForEach(viewModel.messages) { message in
              MessageView(isFromCurrentUser: message.isFromCurrentUser, messageText: message.messageText)
            }
          }
        }
        CustomInputView(text: $messageText, action: sendMessage)
      }
      .navigationTitle("Venom")
      .navigationBarTitleDisplayMode(.inline)
      .padding()
    }
  
  func sendMessage() {
    viewModel.sendMessage(messageText)
    messageText = ""
  }
  
}

struct ChatView_Previews: PreviewProvider {
    static var previews: some View {
        ChatView()
    }
}
