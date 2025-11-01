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
    
    func confirmBooking(office: Office){
        //create a Favorite from the Office you booked
        let favorite = Favorites(
                id: office.id ?? UUID().uuidString,
                imageURL: office.imageUrls,
                name: office.name,
                location: office.address,
                size: office.size,
                price: Int(office.price),
                isFavorite: true
            )
        
        //checks if the office is already in the favorites list
        if !favorites.contains(where: {$0.id == favorite.id } ) {
            favorites.append(favorite)
            print("Added \(favorite.name) to favorites")
            
            
            do{
                try db.collection("favorites").document(favorite.id).setData(from: favorite)
                print("Added \(favorite.name) to Firestore favorites")
                
            } catch {
                print("Error saving favorite to Firestore: \(error.localizedDescription)")
                
            }
            
        } else {
            print("\(favorite.name) is already in favorites")
        }
    }
    
    
    func fetchFavorites() {
        db.collection("favorites").getDocuments {snapshot, error in
            if let error = error {
                print("Error fetching favorites from Firestore: \(error.localizedDescription)")
                return
            }
            if let snapshot = snapshot {
                self.favorites = snapshot.documents.compactMap { document  in
                    try? document.data(as: Favorites.self)
                    
                }
                print("Retrieved \(self.favorites.count) from Firestore favorites")
            }
            
        }
    }
}
