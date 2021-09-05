//
//  UserCell.swift
//  SwiftUIChatTutorial
//
//  Created by admin on 26/8/21.
//

import SwiftUI

struct ConversationCell: View {
    var body: some View {
      
      VStack {
        HStack {
          Image("camel")
            .resizable()
            .scaledToFill()
            .frame(width: 48, height: 48)
            .clipShape(Circle())
          
          VStack(alignment: .leading, spacing: 4) {
            Text("Eddie Brock")
              .font(.system(size: 14, weight: .semibold))
            Text("This is some text message")
              .font(.system(size: 15))
          }
          .foregroundColor(.black)
          Spacer()
        }
        .padding(.horizontal)
        Divider()
      }
      .padding(.top)
    }
}

struct ConversationCell_Previews: PreviewProvider {
    static var previews: some View {
        ConversationCell()
    }
}
