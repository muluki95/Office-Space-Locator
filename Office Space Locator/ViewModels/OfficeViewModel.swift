//
//  OfficeViewModel.swift
//  Office Space Locator
//
//  Created by Esther Nzomo on 10/28/25.
//
import SwiftUI
import Firebase
import FirebaseFirestore
import MapKit

@MainActor
class OfficeViewModel: ObservableObject {
    @Published var offices: [Office] = []
    //@Published var favorites: [Favorites] = []
    @Published var filteredOffices: [Office] = []
    @Published var mapAnnotations: [OfficeAnnotation] = []
    @Published var searchText: String = ""
    @Published var region = MKCoordinateRegion(
    center: CLLocationCoordinate2D(latitude: 39.8283, longitude: -98.5795),
    span: MKCoordinateSpan(latitudeDelta: 50, longitudeDelta: 50)
        )
    @Published var showResultsSheet = false
    private let db = Firestore.firestore()
    
        
    //private let service = OfficeService()
    
    
    
    //fetching the firebase offices
    func fetchOffices() async {
        do {
            let collectionName = "offices"  // 🔹 Make sure this EXACTLY matches your Firestore collection
            let snapshot = try await db.collection(collectionName).getDocuments()
            
            print("Fetched \(snapshot.documents.count) documents from '\(collectionName)' collection.")
            
            if snapshot.documents.isEmpty {
                print(" No documents found. Make sure your Firestore 'offices' collection has documents.")
            }
            
            for doc in snapshot.documents {
                print("Document ID: \(doc.documentID), Data: \(doc.data())")
            }
            
            let data = snapshot.documents.compactMap { try? $0.data(as: Office.self) }
            
            DispatchQueue.main.async {
                self.offices = data
                self.filteredOffices = data
            }
            
            print(" Loaded \(data.count) offices into view model.")
            
        } catch {
            print(" Error fetching Firebase offices: \(error.localizedDescription)")
            print(" Common causes: wrong collection name, empty collection, app connected to wrong Firebase project, or insufficient rules.")
        }
    }

    func search() {
            let query = searchText.lowercased()
                    
            db.collection("offices").getDocuments { snapshot, error in
                        if let error = error {
                            print(" Firestore error: \(error.localizedDescription)")
                            return
                        }
                        
                        guard let documents = snapshot?.documents else {
                            print(" No documents found")
                            return
                        }
                        
                            
                        do {
                                self.offices = try documents.compactMap { doc in
                                    try doc.data(as: Office.self)
                                }.filter { office in
                                    // simple contains check for address or city field
                                    office.address.lowercased().contains(query)
                                }
                                
                                print("Found \(self.offices.count) matching offices")
                            
                                self.updatePins()
                            
                            } catch {
                                print(" Decoding error: \(error)")
                            }
                            // show bottom sheet
                            DispatchQueue.main.async {
                                self.showResultsSheet = true
                            }
                        }
        }
    
    func updatePins() {
        mapAnnotations = offices.map { office in
                OfficeAnnotation(
                    coordinate: office.coordinate,
                    title: office.name,
                    subtitle: office.address
                )
            }
    }
    
    //function that shows pins on the map
    private func updateMapRegionToFitAll() {
            guard !mapAnnotations.isEmpty else { return }
            
            let latitudes = mapAnnotations.map { $0.coordinate.latitude }
            let longitudes = mapAnnotations.map { $0.coordinate.longitude }
            
            let maxLat = latitudes.max()!
            let minLat = latitudes.min()!
            let maxLon = longitudes.max()!
            let minLon = longitudes.min()!
            
            let center = CLLocationCoordinate2D(
                latitude: (maxLat + minLat) / 2,
                longitude: (maxLon + minLon) / 2
            )
            
            // Add some padding
            let span = MKCoordinateSpan(
                latitudeDelta: (maxLat - minLat) * 1.4,
                longitudeDelta: (maxLon - minLon) * 1.4
            )
            
            DispatchQueue.main.async {
                self.region = MKCoordinateRegion(center: center, span: span)
            }
        }

    
    
}
