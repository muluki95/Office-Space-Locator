//
//  OfficeAnnotation.swift
//  Office Space Locator
//
//  Created by Esther Nzomo on 11/30/25.
//
import Foundation
import FirebaseFirestore
import CoreLocation

struct OfficeAnnotation: Identifiable {
    let id = UUID()
    let coordinate: CLLocationCoordinate2D
    let title: String?
    let subtitle: String?
}
