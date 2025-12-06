//
//  ProfileView.swift
//  Office Space Locator
//
//  Created by Esther Nzomo on 10/2/25.
//

import SwiftUI



struct ProfileView: View {
    @EnvironmentObject var authViewModel: AuthenticationViewModel
  
    var body: some View {
        if let user = authViewModel.currentUser {
            List{
                Section {
                    HStack{
                        Text(user.initials)
                            .font(.title)
                            .fontWeight(.semibold)
                            .foregroundColor(.white)
                            .frame(width: 72, height: 72)
                            .background(Color.blue)
                            .clipShape(Circle())
                        
                        VStack(alignment: .leading){
                            Text(user.fullname)
                                .font(.headline)
                                .padding(.top, 4)
                            Text(user.email)
                                .font(.caption)
                                .fontWeight(.semibold)
                                .foregroundColor(.gray)
                        }
                    }
                    
                }
            }
            Section("General"){
                HStack{
                    SettingsRowView(imageName: "gear", title: "Version", tintColor: .gray)
                    
                    Spacer()
                    
                    Text("1.0.0")
                        .font(.subheadline)
                        .foregroundColor(.gray)
                }
                
                HStack{
                    SettingsRowView(imageName: "clock", title: "Last Updated", tintColor: .gray)
                    
                    Spacer()
                    
                    Text("Dec 2025")
                        .font(.subheadline)
                        .foregroundColor(.gray)
                }
                HStack{
                    SettingsRowView(imageName: "person", title: "Developer", tintColor: .gray)
                    
                    Spacer()
                    
                    Text("Esther Nzomo")
                        .font(.subheadline)
                        .foregroundColor(.gray)
                }
                HStack{
                    SettingsRowView(imageName: "app", title: "App Name", tintColor: .gray)
                    
                    Spacer()
                    
                    Text("Office Space Locator")
                        .font(.subheadline)
                        .foregroundColor(.gray)
                }
                HStack {
                    SettingsRowView(imageName: "envelope", title: "Support", tintColor: .gray)
                    Spacer()
                    Text("support@example.com")
                        .font(.subheadline)
                        .accentColor(.gray)
                }
                
            }
            
            Section("Account"){
                Button{
                    
                } label:{
                    SettingsRowView(imageName: "arrow.left.circle.fill", title: "Sign Out",
                        tintColor:.red)
                }
                Button{
                    
                } label:{
                    SettingsRowView(imageName: "xmark.circle.fill", title: "Delete Account",
                        tintColor:.red)
                }
            }
        }
    }
}






#Preview {
    ProfileView()
        .environmentObject(AuthenticationViewModel())
}
