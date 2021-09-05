//
//  UserCell.swift
//  SwiftUIChatTutorial
//
//  Created by admin on 3/9/21.
//

import SwiftUI

struct UserCell: View {
  
  var body: some View {
    
    VStack {
      HStack {
        Image("camel")
          .resizable()
          .scaledToFill()
          .frame(width: 48, height: 48)
          .clipShape(Circle())
        
        VStack(alignment: .leading, spacing: 4) {
          Text("@Venom")
            .font(.system(size: 14, weight: .semibold))
          Text("Eddie Brock")
            .font(.system(size: 15))
        }
        .foregroundColor(.black)
        Spacer()
      }
      .padding(.horizontal)

    }
    .padding(.top)
  }
}

struct UserCell_Previews: PreviewProvider {
    static var previews: some View {
        UserCell()
    }
}
