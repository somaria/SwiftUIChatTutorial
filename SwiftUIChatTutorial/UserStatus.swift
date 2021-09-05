//
//  StatusViewModel.swift
//  SwiftUIChatTutorial
//
//  Created by admin on 10/8/21.
//

import SwiftUI

class StatusViewModel: ObservableObject {
  @Published var status: UserStatus = .notConfigured
  
  func updateStatus(_ status: UserStatus) {
    self.status = status
  }
  
}

enum UserStatus: Int, CaseIterable {
  case notConfigured
  case available
  case busy
  case school
  case movies
  case work
  case batterylow
  case meeting
  case gym
  case sleeping
  case urgentCallsOnly
  
  var title: String {
    switch self {
    case .notConfigured: return "Click Here To Update Your Status"
    case .available: return "Available"
      
    case .busy: return "Busy"
      
    case .school: return "At School"
      
    case .movies: return "At The Movies"
      
    case .work: return "At Work"
      
    case .batterylow: return "Battery About To Die"
      
    case .meeting: return "Meeting"
      
    case .gym: return "At The Gym"
      
    case .sleeping: return "Sleeping"
      
    case .urgentCallsOnly: return "Urgent Calls Only"
      
    }
  }
}
