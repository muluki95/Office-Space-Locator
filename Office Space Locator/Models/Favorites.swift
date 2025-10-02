//
//  Favorites.swift
//  Office Space Locator
//
//  Created by Esther Nzomo on 10/2/25.
//

import Foundation


struct Favorites: Codable, Identifiable, Hashable {
    let id: String
    var imageURL: String
    var name: String
    var location: String
    var size: Int
    var price: Int
}


extension Favorites {
   static let mockData: [Favorites] = [
    Favorites(
                id: UUID().uuidString,
                imageURL: "https://images.unsplash.com/photo-1560185127-6f8a7d6b0d3b?auto=format&fit=crop&w=800&q=80",
                name: "Downtown Hub",
                location: "New York",
                size: 2000,
                price: 2500
            ),
            Favorites(
                id: UUID().uuidString,
                imageURL: "https://images.unsplash.com/photo-1581092795361-5d92b2d6f682?auto=format&fit=crop&w=800&q=80",
                name: "Tech Loft",
                location: "San Francisco",
                size: 1500,
                price: 3000
            ),
            Favorites(
                id: UUID().uuidString,
                imageURL: "https://images.unsplash.com/photo-1570129477492-45c003edd2be?auto=format&fit=crop&w=800&q=80",
                name: "Midtown Workspace",
                location: "Chicago",
                size: 2500,
                price: 2200
            ),
            Favorites(
                id: UUID().uuidString,
                imageURL: "https://images.unsplash.com/photo-1597744469211-0a1fbc83c981?auto=format&fit=crop&w=800&q=80",
                name: "Creative Hub",
                location: "Austin",
                size: 1800,
                price: 2000
            )
    ]
}
