//
//  CustomTextField.swift
//  SwiftUIChatTutorial
//
//  Created by admin on 6/8/21.
//

import SwiftUI

struct CustomTextField: View {
  
  let imageName: String
  let placeholderText: String
  
  let isSecureField: Bool
  
  @Binding var text: String
  
  var body: some View {
    VStack(spacing: 20) {
      HStack(spacing: 16) {
        Image(systemName: imageName)
          .resizable()
          .scaledToFit()
          .frame(width: 20, height: 20)
          .foregroundColor(Color(.darkGray))
        
        if isSecureField {
          SecureField(placeholderText, text: $text)
        }
        else {
          TextField(placeholderText, text: $text)
        }
        
      }
      Divider()
        .background(Color(.darkGray))
    }
  }
}
