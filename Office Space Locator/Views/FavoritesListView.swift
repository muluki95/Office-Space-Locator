//
//  FavoritesView.swift
//  Office Space Locator
//
//  Created by Esther Nzomo on 10/2/25.
//
import SwiftUI
import Kingfisher




struct FavoritesListView: View {
    @EnvironmentObject var viewModel: OfficeViewModel
    
    //@State private var offices = Favorites.mockData
    
    var body: some View {
        NavigationStack {
            ScrollView{
                LazyVStack{
                    if viewModel.favorites.isEmpty {
                        Text("No favorites yet")
                        .foregroundColor(.gray)
                        .padding()
                    } else {
                        ForEach(viewModel.favorites){ office in
                            OfficeCardView(office: office)
                        }
                    }
                    
                }
            }
            .navigationTitle("Office Spaces")
            
        }
        
        
        
    }
}


#Preview {
    FavoritesListView()
        .environmentObject(OfficeViewModel())
}
