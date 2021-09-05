//
//  LoginView.swift
//  SwiftUIChatTutorial
//
//  Created by admin on 6/8/21.
//

import SwiftUI

struct LoginView: View {
  
  @State private var email = ""
  @State private var password = ""
  
  @EnvironmentObject var viewModel: AuthViewModel
  
  var body: some View {
    NavigationView {
      VStack {
        VStack(alignment: .leading, spacing: 12) {
          HStack { Spacer() }
          Text("Hello.")
            .font(.largeTitle)
            .bold()
          Text("Welcome Back")
            .font(.largeTitle)
            .bold()
            .foregroundColor(.blue)
          
          VStack(spacing: 20) {
            CustomTextField(imageName: "envelope", placeholderText: "Email", isSecureField: false, text: $email)
            
            CustomTextField(imageName: "lock", placeholderText: "Password", isSecureField: true, text: $password)
          }
          .padding([.top, .horizontal], 32)
          
          HStack {
            Spacer()
            
            NavigationLink(
              destination: Text("Reset Password..."),
              label: {
                Text("Forgot Password?")
                  .font(.system(size: 13, weight: .semibold))
                  .padding(.top)
                  .padding(.trailing)
              })
            
          }
          
          Button(action: {
            viewModel.login(withEmail: email, password: password)
          }, label: {
            Text("Sign In")
              .font(.headline)
              .foregroundColor(.white)
              .frame(width: 340, height: 50)
              .background(Color.blue)
              .clipShape(Capsule())
              .padding()
          })
          .shadow(color: .gray, radius: 10, x: 0.0, y: 0.0)
          Spacer()
          
        }
        .padding(.leading)
        NavigationLink(
          destination: RegistrationView()
            .navigationBarHidden(true),
          label: {
            HStack {
              Text("Dont Have An Account?")
                .font(.system(size: 13, weight: .semibold))
              Text("Sign Up")
                .font(.system(size: 14, weight: .semibold))
            }
          })
          .padding(.bottom, 32)
      }
    }
    .padding(.top, -56)
  }
}

struct LoginView_Previews: PreviewProvider {
  static var previews: some View {
    LoginView()
  }
}


