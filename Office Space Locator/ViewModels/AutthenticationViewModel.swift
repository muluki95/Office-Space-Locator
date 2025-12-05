//
//  AutthenticationViewModel.swift
//  Office Space Locator
//
//  Created by Esther Nzomo on 12/4/25.
//

import Foundation
import Firebase
import FirebaseAuth
import FirebaseFirestore


class AuthenticationViewModel: ObservableObject {
    @Published var userSession: FirebaseAuth.User?
    @Published var currentUser: User?
    
    
    init() {
        
    }
    
    
    func signIn(email: String, password: String) async throws {
        
        
    }
    
    func createUser(email: String, password: String, fullname: String) async throws {
        do{
            let results = try await Auth.auth().createUser(withEmail: email, password: password)
            self.userSession = results.user
            let user = User(id: results.user.uid, fullname: fullname, email: email)
            let encodedUser = try Firestore.Encoder().encode(user)
            try await Firestore.firestore().collection("users").document(user.id).setData(from: user)
        } catch {
            print("Failed to create a user: \(error.localizedDescription)")
        }
        
    }
    
    func signOut() async throws {
        
    }
    
    func deleteAccount() async throws {
        
    }
    
     func fetchUserData() async{
        
    }
}
