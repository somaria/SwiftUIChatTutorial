//
//  AuthViewModel.swift
//  SwiftUIChatTutorial
//
//  Created by admin on 4/9/21.
//

import Firebase
import UIKit

class AuthViewModel: NSObject, ObservableObject {
  
  @Published var didAuthenticateUser = false
  
  @Published var userSession: FirebaseAuth.User?
  
  private var tempCurrentUser: FirebaseAuth.User?
  
  static let shared = AuthViewModel()
  
  override init() {
    super.init()
    userSession = Auth.auth().currentUser
    fetchUser()
  }
  
  func login(withEmail email: String, password: String) {
    print("Handle login")
    print(email)
    
    Auth.auth().signIn(withEmail: email, password: password) { result, error in
      if let error = error {
        print("not signed in \(error.localizedDescription)")
        return
      }
      print("you are signed in")
      print(result?.user.uid)
      
      guard let user = result?.user else { return }
      self.userSession = user
      
    }
  }
  
  func register(withEmail email: String, password: String, fullName: String, username: String) {
    print("Handle register")
    print("\(email)")
    
    Auth.auth().createUser(withEmail: email, password: password) { result, error in
      
      if let error = error {
        print("failed to register \(error.localizedDescription)")
        return
      }
      
      print("successfully registered user with Firebase")
      
      guard let user = result?.user else { return }
      
      self.tempCurrentUser = user
      
      let data: [String: Any] = [
        "email": email,
        "username": username,
        "fullname": fullName
      ]
      
      Firestore.firestore().collection("users").document(user.uid).setData(data) { _ in
        print("successfully updated user info")
        self.didAuthenticateUser = true
      }
      
    }
    
  }
  
  func uploadProfileImage(_ image: UIImage) {
    print("upload profile photo")
    
    guard let uid = tempCurrentUser?.uid else {
      return
    }
    
    ImageUploader.uploadImage(image: image) { imageUrl in
      Firestore.firestore().collection("users").document(uid).updateData(["profileImageUrl": imageUrl]) { _ in
        
        print("Successfully updated user data")
        self.userSession = self.tempCurrentUser
      }
    }
  }
  
  func signout() {
    print("logging user out")
    self.userSession = nil
    try? Auth.auth().signOut()
  }
  
  func fetchUser() {
    guard let uid = self.userSession?.uid else {
      return
    }
    
    Firestore.firestore().collection("users").document(uid).getDocument { snapshot, _ in
      print("snapshop 462")
      print(snapshot)
      
      guard let data = snapshot?.data() else { return }
      
      print(data)
      
    }
  }
  
}
