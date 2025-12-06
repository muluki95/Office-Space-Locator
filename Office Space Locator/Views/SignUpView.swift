//
//  SignUpView.swift
//  Office Space Locator
//
//  Created by Esther Nzomo on 11/1/25.
//

import SwiftUI


struct SignUpView: View {
    @State var fullname = ""
    @State var email = ""
    @State var password = ""
    @State var confirmPassword = ""
    @Environment(\.dismiss) var dismiss
    @EnvironmentObject var authViewModel: AuthenticationViewModel
    var body: some View {
        NavigationStack{
            VStack{
                Spacer()
                
                VStack(spacing: 24){
                    
                    InputView(text: $email,
                              title: "Email Address",
                              placeholder: "abc@gmail.com",)
                    .autocapitalization(.none)
                    
                    
                    InputView(text: $fullname,
                              title: "Name",
                              placeholder: "Enter your full name")
                    
                    
                    InputView(text: $password,
                              title: "Password",
                              placeholder: "Enter your password",
                              isSecureField: true)
                    
                    
                    
                    ZStack(alignment: .trailing){
                        InputView(text: $confirmPassword,
                                  title: "Confirm Password",
                                  placeholder: "Confirm your password", isSecureField: true)
                        
                        if !password.isEmpty && !confirmPassword.isEmpty {
                            if password == confirmPassword{
                                Image(systemName: "checkmark.circle.fill")
                                    .imageScale(.large)
                                    .fontWeight(.bold)
                                    .foregroundStyle(.green)
                            } else {
                                Image(systemName: "xmark.circle.fill")
                                    .imageScale(.large)
                                    .fontWeight(.bold)
                                    .foregroundStyle(.red)
                            }
                        }
                    }
                    
                }
                .padding(.horizontal)
                
                
                
                Button{
                    Task{
                        if formIsValid && password == confirmPassword {
                            try await authViewModel.createUser(email: email, password: password, fullname: fullname)
                        }
                    }
                } label: {
                    HStack{
                        Text("SIGN UP")
                            .fontWeight(.semibold)
                        Image(systemName: "arrow.right")
                    }
                    .foregroundStyle(.white)
                    .frame(maxWidth: .infinity, maxHeight: 50)
                    
                    
                }
                .background(Color.blue)
                .disabled(!formIsValid)
                .opacity(formIsValid ? 1: 0.5)
                .cornerRadius(10)
                .padding(.horizontal, 12)
                
                Spacer()
                
                Button{
                    dismiss()
                } label: {
                    HStack(spacing: 12){
                        Text("Already have an account?")
                        Text("Login")
                            .fontWeight(.semibold)
                        
                    }
                    .font(.system(size:14))
                    .padding(.horizontal,12)
                }
            }
            .padding(.horizontal, 12)
            
        }
    }
}

extension SignUpView: AuthenticationFormProtocol{
    var formIsValid: Bool{
        return !email.isEmpty && email.contains("@") && !password.isEmpty && password.count > 5
    }
}

#Preview{
    SignUpView()
        .environmentObject(AuthenticationViewModel())
}
