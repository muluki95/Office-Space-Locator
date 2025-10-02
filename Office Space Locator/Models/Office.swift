//
//  Office.swift
//  Office Space Locator
//
//  Created by Esther Nzomo on 10/2/25.
//

import Foundation


struct Office: Codable, Identifiable, Hashable {
    let id: String
    var name: String
    var address: String
    var size: Int
    var available: Bool
    
}



extension  Office{
    static let sampleData: [Office] = [
        Office(id: UUID().uuidString, name: "Downtown Hub", address: "123 Main St", size: 20, available: true),
        Office(id: UUID().uuidString,name: "Tech Park", address: "456 Innovation Ave", size: 50, available: false),
        Office(id: UUID().uuidString,name: "Creative Loft", address: "789 Market Rd", size: 15, available: true)
        ]
        
    
}
