//
//  OfficeViewModel.swift
//  Office Space Locator
//
//  Created by Esther Nzomo on 10/28/25.
//
import SwiftUI
import FirebaseFirestore
import MapKit

@MainActor
class OfficeViewModel: ObservableObject {
    @Published var offices: [Office] = []
    //@Published var favorites: [Favorites] = []
    @Published var filteredOffices: [Office] = []
    @Published var searchText: String = ""
    @Published var cameraPosition: MapCameraPosition = .automatic
    @Published var userLocation: CLLocationCoordinate2D? = nil
    
    
    @Published var mapPosition: MapCameraPosition = .region(
        MKCoordinateRegion(
            center: CLLocationCoordinate2D(latitude: 39.8283, longitude: -98.5795),  // USA center
            span: MKCoordinateSpan(latitudeDelta: 30, longitudeDelta: 30)
        )
    )
      
    
    private let db = Firestore.firestore()
    
    private let apiKey = "AIzaSyDDspSlxfXNVAt9ZfKKzVx8WgnOZ_ZejL0"
    
    //private let service = OfficeService()
    
    
    
    //fetching the firebase offices
    func fetchOffices() async {
        do {
            let collectionName = "offices"  // 🔹 Make sure this EXACTLY matches your Firestore collection
            let snapshot = try await db.collection(collectionName).getDocuments()
            
            print("✅ Fetched \(snapshot.documents.count) documents from '\(collectionName)' collection.")
            
            if snapshot.documents.isEmpty {
                print("⚠️ No documents found. Make sure your Firestore 'offices' collection has documents.")
            }
            
            for doc in snapshot.documents {
                print("Document ID: \(doc.documentID), Data: \(doc.data())")
            }
            
            let data = snapshot.documents.compactMap { try? $0.data(as: Office.self) }
            
            DispatchQueue.main.async {
                self.offices = data
                self.filteredOffices = data
            }
            
            print("✅ Loaded \(data.count) offices into view model.")
            
        } catch {
            print("❌ Error fetching Firebase offices: \(error.localizedDescription)")
            print("💡 Common causes: wrong collection name, empty collection, app connected to wrong Firebase project, or insufficient rules.")
        }
    }

        func search() {
            let text = searchText.lowercased()
            
            filteredOffices = offices.filter { office in
                    office.address.lowercased().contains(text)
            }
            
            //moves map to first matching office
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
