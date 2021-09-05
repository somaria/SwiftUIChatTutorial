//
//  Extensions.swift
//  SwiftUIChatTutorial
//
//  Created by admin on 3/9/21.
//

import UIKit

extension UIApplication {
  
  func endEditing() {
    sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
  }
  
}
