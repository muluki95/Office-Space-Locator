//
//  FavoritesView.swift
//  Office Space Locator
//
//  Created by Esther Nzomo on 10/2/25.
//
import SwiftUI
import Kingfisher




struct FavoritesListView: View {
    
    @State private var offices = Favorites.mockData
    
    var body: some View {
        NavigationStack {
            ScrollView{
                LazyVStack{
                    ForEach(offices){ office in
                        OfficeCardView(office: office)
                        
                    }
                    
                }
            }
            .navigationTitle("Office Spaces")
            
        }
        
        
        
    }
}


#Preview {
    FavoritesListView()
}
