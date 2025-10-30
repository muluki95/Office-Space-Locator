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
    @Published var favorites: [Favorites] = []
    
    
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
    
    
    func toggleFavorite(for office: Favorites) {
        if favorites.contains(where: { $0.id == office.id }) {
            // If this office is already in the favorites list, remove it
            favorites.removeAll { $0.id == office.id }
        } else {
            // Otherwise, add it to the favorites list
            favorites.append(office)
        }
    }
    
    func isFavorite(office: Favorites) -> Bool {
        favorites.contains(where: {$0.id == office.id && $0.isFavorite})
    }
    
    func confirmBooking(office: Favorites){
        if !favorites.contains(where: {$0.id == office.id } ) {
            var newFavorite = office
            newFavorite.isFavorite = true
            favorites.append(newFavorite)
            print("Added \(office.name) to favorites")
            
            
        } else {
            print("\(office.name) is already in favorites")
        }
    }
}
