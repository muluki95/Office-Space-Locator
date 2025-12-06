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
            if authViewModel.currentUser != nil {
                LoginView()
                    .environmentObject(authViewModel)
            } else {
                NavigationStack{
                    SignUpView()
                        .environmentObject(authViewModel)
                }
            }
        }
    }
}

#Preview {
    ContentView()
        .environmentObject(AuthenticationViewModel())
}
