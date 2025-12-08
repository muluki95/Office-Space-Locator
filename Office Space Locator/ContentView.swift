//
//  ContentView.swift
//  Office Space Locator
//
//  Created by Esther Nzomo on 10/2/25.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var authViewModel: AuthenticationViewModel
    
    
    var body: some View {
        Group {
            if authViewModel.userSession != nil {
                ProfileView()
                    .environmentObject(authViewModel)
            } else {
               
                    LoginView()
                        .environmentObject(authViewModel)
                
            }
                
        }
        .animation(.easeInOut, value: authViewModel.userSession)
    }
}

#Preview {
    ContentView()
        .environmentObject(AuthenticationViewModel())
}
