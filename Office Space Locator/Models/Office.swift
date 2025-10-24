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
    var imageURLs: [String]
    var price: Double
    
}



extension  Office{
    static let sampleData: [Office] = [
        Office(id: UUID().uuidString, name: "Downtown Hub", address: "123 Main St", size: 20, available: true, imageURLs:
                ["https://plus.unsplash.com/premium_photo-1661964203218-bf8778198314?ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8NXx8bG9mdCUyMG9mZmljZSUyMHNwYWNlc3xlbnwwfHwwfHx8MA%3D%3D&auto=format&fit=crop&q=60&w=900",
                    "https://images.unsplash.com/photo-1631248988030-141c05a37dd2?ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Nnx8bG9mdCUyMG9mZmljZSUyMHNwYWNlc3xlbnwwfHwwfHx8MA%3D%3D&auto=format&fit=crop&q=60&w=900",
                    "https://images.unsplash.com/photo-1631247770372-1971e07dd9f4?ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8bG9mdCUyMG9mZmljZSUyMHNwYWNlc3xlbnwwfHwwfHx8MA%3D%3D&auto=format&fit=crop&q=60&w=900"],
               price: 2000.00
              ),
        Office(id: UUID().uuidString,name: "Tech Park", address: "456 Innovation Ave", size: 50, available: false, imageURLs: [
            "https://images.unsplash.com/photo-1594182878996-036fe2646c11?ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MjZ8fGNyZWF0aXZlJTIwaHViJTIwb2ZmaWNlJTIwc3BhY2VzfGVufDB8fDB8fHww&auto=format&fit=crop&q=60&w=900",
                "https://images.unsplash.com/photo-1666718622537-6748ca5322e2?ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mzl8fGNyZWF0aXZlJTIwaHViJTIwb2ZmaWNlJTIwc3BhY2VzfGVufDB8fDB8fHww&auto=format&fit=crop&q=60&w=900",
                "https://images.unsplash.com/photo-1669369456388-1cd3fb7e69de?ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MjJ8fGNyZWF0aXZlJTIwaHViJTIwb2ZmaWNlJTIwc3BhY2VzfGVufDB8fDB8fHww&auto=format&fit=crop&q=60&w=900"
        ],
               price: 2500.00
              ),
        Office(id: UUID().uuidString,name: "Creative Loft", address: "789 Market Rd", size: 15, available: true, imageURLs: [
            "https://plus.unsplash.com/premium_photo-1661878925553-ccd4365fabc6?ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8NXx8Y3JlYXRpdmUlMjBodWIlMjBvZmZpY2UlMjBzcGFjZXN8ZW58MHx8MHx8fDA%3D&auto=format&fit=crop&q=60&w=900",
                "https://images.unsplash.com/photo-1518829384985-bfa4e1aa1efd?ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTF8fGNyZWF0aXZlJTIwaHViJTIwb2ZmaWNlJTIwc3BhY2VzfGVufDB8fDB8fHww&auto=format&fit=crop&q=60&w=900",
                "https://images.unsplash.com/photo-1572025442646-866d16c84a54?ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTR8fGNyZWF0aXZlJTIwaHViJTIwb2ZmaWNlJTIwc3BhY2VzfGVufDB8fDB8fHww&auto=format&fit=crop&q=60&w=900"
        ],
               price: 3000.00
              )
        ]
        
    
}
