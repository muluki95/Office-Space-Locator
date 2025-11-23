//
//  FavoritesViewModel.swift
//  Office Space Locator
//
//  Created by Esther Nzomo on 11/23/25.
//
import SwiftUI
import FirebaseFirestore



class FavoritesViewModel: ObservableObject {
    @Published var offices: [Office] = []
    @Published var favorites: [Favorites] = []
    
    private let db = Firestore.firestore()
    
    
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
    
    
    func deleteFavorites(_ favorite: Favorites) {
        favorites.removeAll { $0.id == favorite.id}
        print("Removed \(favorite.name) from favorites")
        
        db.collection("favorites").document(favorite.id).delete { error in
            if let error = error {
                print("Error deleting favorite from Firestore: \(error.localizedDescription)")
            } else {
                print("Successfully deleted \(favorite.name) from Firestore")
            }
            
        }
        
    }
}
