import SwiftUI

struct ProfileView: View {
    @EnvironmentObject var authViewModel: AuthenticationViewModel

    var body: some View {
        Group {
            if let user = authViewModel.currentUser {
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
                            Text("support@example.com")
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

                        Button {
                            // delete logic...
                        } label: {
                            SettingsRowView(imageName: "xmark.circle.fill",
                                            title: "Delete Account",
                                            tintColor: .red)
                        }
                    }
                }
            } else {
               
                VStack {
                    ProgressView()
                        .progressViewStyle(CircularProgressViewStyle())
                    Text("Loading profile...")
                        .foregroundColor(.gray)
                        .padding(.top, 8)
                }
                .onAppear {
                    Task { await authViewModel.fetchUserData() }
                            }
            }
        }
        
    }
}

#Preview {
    ProfileView()
        .environmentObject(AuthenticationViewModel())
}
