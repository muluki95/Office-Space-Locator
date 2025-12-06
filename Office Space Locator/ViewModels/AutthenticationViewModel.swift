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

@MainActor
class AuthenticationViewModel: ObservableObject {
    @Published var userSession: FirebaseAuth.User?
    @Published var currentUser: User?
    
    
    init() {
        self.userSession = Auth.auth().currentUser
        
        Task{
            await fetchUserData()
        }
        
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
            await fetchUserData()
        } catch {
            print("Failed to create a user: \(error.localizedDescription)")
        }
        
    }
    
    func signOut() async throws {
        
    }
    
    func deleteAccount() async throws {
        
    }
    
    func fetchUserData() async{
       
            guard let uid = Auth.auth().currentUser?.uid else {return}
            
            guard let snapshot = try? await Firestore.firestore().collection("users").document(uid).getDocument() else {return}
            self.currentUser = try? snapshot.data(as: User.self)
       
           print("current user is \(self.currentUser)")
        
    }
}
