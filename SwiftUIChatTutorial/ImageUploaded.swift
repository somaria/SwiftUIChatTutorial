//
//  ImageUploaded.swift
//  SwiftUIChatTutorial
//
//  Created by admin on 4/9/21.
//

import Firebase
import UIKit

struct ImageUploader {
  
  static func uploadImage(image: UIImage, completion: @escaping(String) -> Void) {
    
    guard let imageData = image.jpegData(compressionQuality: 0.5) else { return }
    
    let filename = NSUUID().uuidString
    let ref = Storage.storage().reference(withPath: "profile_images/\(filename)")
    
    ref.putData(imageData, metadata: nil) { _, error in
      
      if let error = error {
        print("failed to upload data \(error.localizedDescription)")
        return
      }
      
      print("successfully upload image to firebase storage")
      
      ref.downloadURL { url, _ in
        guard let imageUrl = url?.absoluteString else { return }
        
        completion(imageUrl)
        
      }
      
    }
    
    
  }
  
}
