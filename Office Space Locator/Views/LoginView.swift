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
    var body: some View {
        NavigationStack{
            VStack{
                
                VStack(spacing: 24){
                InputView(text: $email,
                              title: "Email Address",
                              placeholder: "abc@gmail..com")
                .autocapitalization(.none)
                    
                    InputView(text: $password,
                              title: "Password",
                              placeholder: "Enter your password",
                              isSecureField: true
                    )
                    .padding(.top, 12)
                    
                    
                    Button{
                        
                    } label: {
                        HStack{
                            Text("LOGIN")
                                .fontWeight(.semibold)
                            Image(systemName: "arrow.right")
                        }
                        .foregroundStyle(.white)
                        .frame(maxWidth: .infinity, maxHeight: 50)
                        
                        
                    }
                    .background(Color.blue)
                    .cornerRadius(10)
                    .padding(.horizontal, 12)
                    
                   
                    
                }
                .padding(.horizontal, 12)
                
                
            }
        }
    }
}



#Preview{
    LoginView()
}
