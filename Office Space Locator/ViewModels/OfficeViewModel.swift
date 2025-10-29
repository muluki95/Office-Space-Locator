//
//  OfficeViewModel.swift
//  Office Space Locator
//
//  Created by Esther Nzomo on 10/28/25.
//
import SwiftUI
import FirebaseFirestore



class OfficeViewModel: ObservableObject {
    @Published var offices: [Office] = []
    
    
    private let db = Firestore.firestore()
    
    
    
    
    func fetchOffices() async {
        do{
            let snapshot = try await db.collection("offices").getDocuments()
            print("📦 Documents found: \(snapshot.documents.count)")
            
            for doc in snapshot.documents {
                        print("➡️ \(doc.data())")
                    }
                    
            self.offices = snapshot.documents.compactMap{ doc in
                try? doc.data(as: Office.self)
                
            }
            print(" Loaded \(offices.count) offices from Firebase.")
        } catch {
            print("Error fetching offices: \(error.localizedDescription)")
        }
    }
    
}
