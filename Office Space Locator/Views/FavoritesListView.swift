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
    @EnvironmentObject var favoritesViewModel: FavoritesViewModel
    
    //@State private var offices = Favorites.mockData
    
    var body: some View {
        NavigationStack {
            ScrollView{
                LazyVStack{
                    if favoritesViewModel.favorites.isEmpty {
                        Text("No favorites yet")
                        .foregroundColor(.gray)
                        .padding()
                    } else {
                        ForEach(favoritesViewModel.favorites){ office in
                            OfficeCardView(office: office)
                        }
                    }
                    
                }
            }
            .navigationTitle("Office Spaces")
            .onAppear{
                favoritesViewModel.fetchFavorites()
            }
            
        }
        
        
        
    }
}


#Preview {
    FavoritesListView()
        .environmentObject(OfficeViewModel())
        .environmentObject(FavoritesViewModel())
}
