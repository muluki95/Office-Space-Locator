//
//  Office.swift
//  Office Space Locator
//
//  Created by Esther Nzomo on 10/2/25.
//

import Foundation
import FirebaseFirestore


struct Office: Codable, Identifiable, Hashable {
    @DocumentID var id: String?
    var name: String
    var address: String
    var size: Int
    var price: Double
    
    
    var available: Bool {
            availableInt == 1
        }
        
        private let availableInt: Int
        let imageUrls: [String]
        
        enum CodingKeys: String, CodingKey {
            case id
            case name
            case address
            case price
            case size
            case availableInt = "available"
            case imageUrls
        }
    
    
}



