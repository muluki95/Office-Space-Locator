//
//  OfficeViewModel.swift
//  Office Space Locator
//
//  Created by Esther Nzomo on 10/28/25.
//
import SwiftUI
import FirebaseFirestore
import MapKit


class OfficeViewModel: ObservableObject {
    @Published var offices: [Office] = []
    //@Published var favorites: [Favorites] = []
    @Published var filteredOffices: [Office] = []
    @Published var searchText: String = ""
    
    @Published var mapPosition: MapCameraPosition = .region(
        MKCoordinateRegion(
            center: CLLocationCoordinate2D(latitude: 39.8283, longitude: -98.5795),  // USA center
            span: MKCoordinateSpan(latitudeDelta: 30, longitudeDelta: 30)
        )
    )
    
    
    private let db = Firestore.firestore()
    
    
    
    
    func fetchOffices() async {
        do{
            let snapshot = try await db.collection("offices").getDocuments()
            print("📦 Documents found: \(snapshot.documents.count)")
            
            for doc in snapshot.documents {
                        print("➡️ \(doc.data())")
                    }
                    
            self.offices = snapshot.documents.compactMap{ doc in
                try? doc.data(as: Office.self)
                
            }
            print(" Loaded \(offices.count) offices from Firebase.")
        } catch {
            print("Error fetching offices: \(error.localizedDescription)")
        }
    }
    
    
    func searchByLocation() {
        let query = searchText.lowercased()
        
        filteredOffices = offices.filter {
            $0.address.lowercased().contains(query)
        }
        
        //move map to first matching office
        if let first = filteredOffices.first {
            mapPosition = .region(
                MKCoordinateRegion(
                    center: first.coordinate,
                    span: MKCoordinateSpan(latitudeDelta: 0.2, longitudeDelta: 0.2)
                )
            )

        }
    }
    
    
    
}
