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


protocol AuthenticationFormProtocol {
    var formIsValid: Bool { get }
}

@MainActor
class AuthenticationViewModel: ObservableObject {
    @Published var userSession: FirebaseAuth.User?
    @Published var currentUser: User?
    
    
    init() {
        self.userSession = Auth.auth().currentUser
        if userSession != nil {
            Task{
                await fetchUserData()
            }
        }
    }
    
    
    func signIn(email: String, password: String) async throws {
        do{
            let result = try await Auth.auth().signIn(withEmail: email, password: password)
            self.userSession = result.user
            await fetchUserData()
        } catch {
            print("Failed to sign in: \(error.localizedDescription)")
        }
        
    }
    
    func createUser(email: String, password: String, fullname: String) async throws {
        do{
            let result = try await Auth.auth().createUser(withEmail: email, password: password)
            self.userSession = result.user
            let user = User(id: result.user.uid, fullname: fullname, email: email)
            try await Firestore.firestore().collection("users").document(user.id).setData(from: user, merge: false)
            await fetchUserData()
        } catch {
            print("Failed to create a user: \(error.localizedDescription)")
        }
        
    }
    
    func signOut() {
        do{
            try Auth.auth().signOut()
            self.userSession = nil
            self.currentUser = nil
        } catch {
            print("Failed to sign out: \(error.localizedDescription)")
        }
    }
    
    func deleteAccount() async throws {
        
    }
    
    func fetchUserData() async{
        
        guard let uid = Auth.auth().currentUser?.uid else {
            print(" No UID found")
            return
        }
        do {
            let snapshot = try await Firestore.firestore()
                .collection("users")
                .document(uid)
                .getDocument()
            
            if snapshot.exists {
                self.currentUser = try snapshot.data(as: User.self)
                print("Fetched user: \(String(describing: self.currentUser))")
            } else {
                print("User document does not exist")
            }
        } catch {
            print("Failed to fetch user: \(error.localizedDescription)")
        }
    }
}
