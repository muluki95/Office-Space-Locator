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
    @Published var isLoadingUser = false
    @Published var didCheckSession = false
    private var authStateListenerHandle: AuthStateDidChangeListenerHandle?
    
    
    init() {
        //self.userSession = Auth.auth().currentUser
        addAuthStateListener()
            
    }
    
    private func addAuthStateListener() {
          authStateListenerHandle =  Auth.auth().addStateDidChangeListener { [weak self] _, user in
              guard let self = self else { return }
               self.userSession = user
              if let _ = user {
                              Task {
                                  await self.fetchUserData()
                                  self.didCheckSession = true
                              }
                          } else {
                              self.currentUser = nil
                              self.didCheckSession = true
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
            let result = try await Auth.auth().createUser(withEmail:email, password:password)
                        self.userSession = result.user
                        let user = User(uid: result.user.uid, fullname:fullname, email: email)
                        let encodedUser = try Firestore.Encoder().encode(user)
                        try await Firestore.firestore().collection("users").document(user.uid).setData(encodedUser)
                        await fetchUserData()
                        
                        print("User created successfully")
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
        
        guard let user = Auth.auth().currentUser else { return }
        try await user.delete()
        
    }
    
    func fetchUserData() async{
        
        guard let uid = self.userSession?.uid else {
                   print(" No user session found.")
                   return
               }
            isLoadingUser = true
            defer { isLoadingUser = false }
        
               do {
                   
                let snapshot = try await Firestore.firestore().collection("users").document(uid).getDocument()
                   print("📌 Document exists:", snapshot.exists)

                           if !snapshot.exists {
                               print("❌ Document for this user does NOT exist in Firestore!")
                           }

                           print("📄 Raw snapshot data:", snapshot.data() ?? "nil")

                           self.currentUser = try snapshot.data(as: User.self)

                           print("🎉 Current user loaded: \(self.currentUser?.fullname ?? "Unknown")")

                       } catch {
                           print("💥 DECODING ERROR:", error)
                       }
        
    }
}
