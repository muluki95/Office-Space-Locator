//
//  LoginView.swift
//  Office Space Locator
//
//  Created by Esther Nzomo on 11/1/25.
//

import SwiftUI


struct LoginView: View {
    
    @State var email = ""
    @State var password = ""
    @EnvironmentObject var authViewModel: AuthenticationViewModel
    
    var body: some View {
        NavigationStack{
           
            VStack{
                
                VStack(spacing: 24){
                Spacer()
                InputView(text: $email,
                              title: "Email Address",
                              placeholder: "abc@gmail..com")
                .textInputAutocapitalization(.never)
                    
                    InputView(text: $password,
                              title: "Password",
                              placeholder: "Enter your password",
                              isSecureField: true
                    )
                    
                    Button{
                        Task{
                            try await authViewModel.signIn(email: email, password: password)
                        }
                    } label: {
                        HStack{
                            Text("SIGN IN")
                                .fontWeight(.semibold)
                            Image(systemName: "arrow.right")
                        }
                        .foregroundStyle(.white)
                        .frame(maxWidth: .infinity, maxHeight: 50)
                        
                        
                    }
                    .background(Color.blue)
                    .cornerRadius(10)
                    .padding(.horizontal, 12)
                    
                    Spacer()
                    NavigationLink {
                        SignUpView()
                            .navigationBarBackButtonHidden(true)
                    } label: {
                        HStack{
                            Text("Don't have an account?")
                            Text("Sign Up")
                                .fontWeight(.bold)
                        }
                        .font(.system(size: 14))
                    }
                   
                   
                    
                    
                    
                   
                    
                }
                .padding(.horizontal, 12)
                
                
            }
           
        }
        
    }
}



#Preview{
    LoginView()
        .environmentObject(AuthenticationViewModel())
}
