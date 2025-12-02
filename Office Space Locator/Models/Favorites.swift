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


