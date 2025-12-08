//
//  User.swift
//  Office Space Locator
//
//  Created by Esther Nzomo on 12/4/25.
//

import Foundation
import Combine
import SwiftUI

struct User: Codable, Identifiable {
    var id: String {uid}
    var uid: String
    var fullname: String
    var email: String
    
    
    var initials: String {
        let formatter = PersonNameComponentsFormatter()
        if let components = formatter.personNameComponents(from: fullname){
            formatter.style = .abbreviated
            return formatter.string(from: components)
        }
        
        return ""
    }
    enum CodingKeys: String, CodingKey {
            case uid
            case fullname
            case email
            
        }
}


extension User{
    static var MOCK_USER = User(uid: NSUUID().uuidString, fullname: "Esther Nzomo", email: "esther@example.com")
}
