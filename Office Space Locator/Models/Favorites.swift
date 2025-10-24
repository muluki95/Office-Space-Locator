//
//  Favorites.swift
//  Office Space Locator
//
//  Created by Esther Nzomo on 10/2/25.
//

import Foundation


struct Favorites: Codable, Identifiable, Hashable {
    let id: String
    var imageURL: [String]
    var name: String
    var location: String
    var size: Int
    var price: Int
    var isFavorite: Bool
}


extension Favorites {
   static let mockData: [Favorites] = [
    Favorites(
                id: UUID().uuidString,
                imageURL: ["https://images.unsplash.com/photo-1730448119075-41e62eb4f6d8?w=900&auto=format&fit=crop&q=60&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MjB8fHZhY2FudCUyMGVtcHR5JTIwb2ZmaWNlcyUyMGZvciUyMGxlYXNlfGVufDB8fDB8fHww",
                    "https://images.unsplash.com/photo-1582653291997-079a1c04e5a1?w=900&auto=format&fit=crop&q=60&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8Y29uZmVyZW5jZSUyMHJvb218ZW58MHx8MHx8fDA%3D",
                    "https://images.unsplash.com/photo-1651442897558-47cff0f64bd9?w=900&auto=format&fit=crop&q=60&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Nnx8b2ZmaWNlJTIwYmF0aHJvb21zfGVufDB8fDB8fHww"],
                name: "Downtown Hub",
                location: "New York",
                size: 2000,
                price: 2500,
                isFavorite: true
            ),
            Favorites(
                id: UUID().uuidString,
                imageURL: ["https://plus.unsplash.com/premium_photo-1661964203218-bf8778198314?ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8NXx8bG9mdCUyMG9mZmljZSUyMHNwYWNlc3xlbnwwfHwwfHx8MA%3D%3D&auto=format&fit=crop&q=60&w=900",
                    "https://images.unsplash.com/photo-1631248988030-141c05a37dd2?ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Nnx8bG9mdCUyMG9mZmljZSUyMHNwYWNlc3xlbnwwfHwwfHx8MA%3D%3D&auto=format&fit=crop&q=60&w=900",
                    "https://images.unsplash.com/photo-1631247770372-1971e07dd9f4?ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8bG9mdCUyMG9mZmljZSUyMHNwYWNlc3xlbnwwfHwwfHx8MA%3D%3D&auto=format&fit=crop&q=60&w=900"],
                name: "Tech Loft",
                location: "San Francisco",
                size: 1500,
                price: 3000,
                isFavorite: false
            ),
            Favorites(
                id: UUID().uuidString,
                imageURL: ["https://images.unsplash.com/photo-1594182878996-036fe2646c11?ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MjZ8fGNyZWF0aXZlJTIwaHViJTIwb2ZmaWNlJTIwc3BhY2VzfGVufDB8fDB8fHww&auto=format&fit=crop&q=60&w=900",
                    "https://images.unsplash.com/photo-1666718622537-6748ca5322e2?ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mzl8fGNyZWF0aXZlJTIwaHViJTIwb2ZmaWNlJTIwc3BhY2VzfGVufDB8fDB8fHww&auto=format&fit=crop&q=60&w=900",
                    "https://images.unsplash.com/photo-1669369456388-1cd3fb7e69de?ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MjJ8fGNyZWF0aXZlJTIwaHViJTIwb2ZmaWNlJTIwc3BhY2VzfGVufDB8fDB8fHww&auto=format&fit=crop&q=60&w=900"],
                name: "Midtown Workspace",
                location: "Chicago",
                size: 2500,
                price: 2200,
                isFavorite: false
            ),
            Favorites(
                id: UUID().uuidString,
                imageURL: ["https://plus.unsplash.com/premium_photo-1661878925553-ccd4365fabc6?ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8NXx8Y3JlYXRpdmUlMjBodWIlMjBvZmZpY2UlMjBzcGFjZXN8ZW58MHx8MHx8fDA%3D&auto=format&fit=crop&q=60&w=900",
                    "https://images.unsplash.com/photo-1518829384985-bfa4e1aa1efd?ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTF8fGNyZWF0aXZlJTIwaHViJTIwb2ZmaWNlJTIwc3BhY2VzfGVufDB8fDB8fHww&auto=format&fit=crop&q=60&w=900",
                    "https://images.unsplash.com/photo-1572025442646-866d16c84a54?ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTR8fGNyZWF0aXZlJTIwaHViJTIwb2ZmaWNlJTIwc3BhY2VzfGVufDB8fDB8fHww&auto=format&fit=crop&q=60&w=900"],
                name: "Creative Hub",
                location: "Austin",
                size: 1800,
                price: 2000,
                isFavorite: true
                
            )
    ]
}
