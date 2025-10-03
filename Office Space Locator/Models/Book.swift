//
//  Book.swift
//  Office Space Locator
//
//  Created by Esther Nzomo on 10/3/25.
//

import Foundation


struct Book: Codable, Identifiable, Hashable {
    let id: String
    var startDate: Date
    var endDate: Date
    var estimatedCost: Double
    
}
