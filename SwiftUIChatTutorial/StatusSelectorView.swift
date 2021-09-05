//
//  StatusSelectorView.swift
//  StatusSelectorView
//
//  Created by admin on 10/8/21.
//

import SwiftUI

struct StatusSelectorView: View {
  
  @ObservedObject var viewModel = StatusViewModel()
  
    var body: some View {
      ZStack {
        Color(.systemGroupedBackground).ignoresSafeArea()
        
        ScrollView {
          VStack(alignment: .leading) {
            Text("CURRENTLY SET TO")
              .foregroundColor(.gray)
              .padding()
            
            StatusCell(status: viewModel.status)
            Text("SELECT YOUR STATUS")
              .foregroundColor(.gray)
              .padding()
            
            ForEach((UserStatus.allCases.filter({ $0 != .notConfigured
            })), id:\.self) { status in
              Button(action: {
                viewModel.updateStatus(status)
              }, label: {
                StatusCell(status: status)
              })
            }
          }
        }
      }
    }
}

struct StatusSelectorView_Previews: PreviewProvider {
    static var previews: some View {
        StatusSelectorView()
    }
}

struct StatusCell: View {
  
  let status: UserStatus
  
  var body: some View {
    VStack(spacing: 4) {
      HStack {
        Text(status.title)
          .foregroundColor(.black)
        Spacer()
      }
      .frame(height: 56)
      .padding(.horizontal)
      .background(Color.white)
    }
  }
}
