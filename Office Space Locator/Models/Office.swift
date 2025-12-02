//
//  Office.swift
//  Office Space Locator
//
//  Created by Esther Nzomo on 10/2/25.
//

import Foundation
import FirebaseFirestore
import CoreLocation

struct Office: Codable, Identifiable, Hashable {
    @DocumentID var id: String?
        var name: String
        var address: String
        var size: Int
        var price: Double
        let imageUrls: [String]
        var latitude: Double = 0
        var longitude: Double = 0
        var isBooked = false
    
    //coordinates for MapKit
       var coordinate: CLLocationCoordinate2D {
            CLLocationCoordinate2D(latitude: latitude ,
                                   longitude: longitude )
        }
        
        enum CodingKeys: String, CodingKey {
            case id
            case name
            case address
            case price
            case size
            case imageUrls
            case latitude
            case longitude
        }
    
    
}


