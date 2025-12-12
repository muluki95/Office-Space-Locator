import SwiftUI

struct ProfileView: View {
    @EnvironmentObject var authViewModel: AuthenticationViewModel
    @State private var showDeleteAlert = false

    var body: some View {
        Group {
            if authViewModel.userSession == nil {
                VStack(spacing: 16) {
                    Image(systemName: "person.crop.circle.fill.badge.exclamationmark")
                        .resizable()
                        .frame(width: 72, height: 72)
                        .foregroundColor(.gray)
                    
                    Text("You are not logged in")
                        .font(.headline)
                        .foregroundColor(.gray)
                    
                    Text("Please log in to access your profile.")
                        .font(.subheadline)
                        .foregroundColor(.gray)
                        .multilineTextAlignment(.center)
                        .padding(.horizontal)
                }
                .padding()
            }
            else if authViewModel.isLoadingUser {
                            VStack {
                                ProgressView()
                                    .progressViewStyle(CircularProgressViewStyle())
                                Text("Loading profile...")
                                    .foregroundColor(.gray)
                                    .padding(.top, 8)
                            }
                            .padding()
                        }
            else if let user = authViewModel.currentUser {
                List {
                    // USER INFO SECTION
                    Section {
                        HStack {
                            Text(user.initials.isEmpty ? "?" : user.initials)
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
                    
                    // GENERAL SECTION
                    Section("General") {
                        HStack {
                            SettingsRowView(imageName: "gear", title: "Version", tintColor: .gray)
                            Spacer()
                            Text("1.0.0")
                                .foregroundColor(.gray)
                        }
                        
                        HStack {
                            SettingsRowView(imageName: "clock", title: "Last Updated", tintColor: .gray)
                            Spacer()
                            Text("Dec 2025")
                                .foregroundColor(.gray)
                        }
                        
                        HStack {
                            SettingsRowView(imageName: "person", title: "Developer", tintColor: .gray)
                            Spacer()
                            Text("Esther Nzomo")
                                .foregroundColor(.gray)
                        }
                        
                        HStack {
                            SettingsRowView(imageName: "app", title: "App Name", tintColor: .gray)
                            Spacer()
                            Text("Office Space Locator")
                                .foregroundColor(.gray)
                        }
                        
                        HStack {
                            SettingsRowView(imageName: "envelope", title: "Support", tintColor: .gray)
                            Spacer()
                            Text("https://muluki95.github.io/office-space-locator-support/")
                                .foregroundColor(.gray)
                        }
                    }
                    
                    // ACCOUNT SECTION
                    Section("Account") {
                        Button {
                            authViewModel.signOut()
                        } label: {
                            SettingsRowView(imageName: "arrow.left.circle.fill",
                                            title: "Sign Out",
                                            tintColor: .red)
                        }
                        
                        Button(role: .destructive) {
                         showDeleteAlert = true
                        } label: {
                            SettingsRowView(imageName: "xmark.circle.fill",
                                            title: "Delete Account",
                                            tintColor: .red)
                        }
                        .alert("Delete Account", isPresented: $showDeleteAlert){
                            Button("Delete",role: .destructive){
                                Task{
                                     try await authViewModel.deleteAccount()
                                }
                            }
                            
                            Button("Cancel", role: .cancel){
                                
                            }
                        } message: {
                            Text("Are you sure you want to permanently delete your account?")
                            
                        }
                        
                    }
                }
            }
        
            else {
                    Text("Failed to load user profile")
                                .foregroundColor(.red)
                                .padding()
                        }
                    }
                    .onAppear {
                        // Fetch user data if session exists and currentUser is nil
                        if authViewModel.userSession != nil && authViewModel.currentUser == nil {
                            Task { await authViewModel.fetchUserData() }
                        }
                    }
        }
        
    }


#Preview {
    ProfileView()
        .environmentObject(AuthenticationViewModel())
}
