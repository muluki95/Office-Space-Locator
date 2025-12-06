//
//  Home.swift
//  Office Space Locator
//
//  Created by Esther Nzomo on 10/2/25.
//

import SwiftUI



struct HomeView: View {
    @EnvironmentObject var viewModel: OfficeViewModel
    @EnvironmentObject var favoritesViewModel: FavoritesViewModel
    @EnvironmentObject  var authViewModel: AuthenticationViewModel
    
    @State private var selectedTab = 0
    var body: some View {
        TabView {
            HomeContent()
                .tabItem {
                    VStack{
                        Image(systemName: selectedTab == 0 ? "house.fill" : "house")
                        Text("Home")
                    }
                }
                .tag(0)
           FavoritesListView()
                .tabItem {
                    VStack{
                        Image(systemName: selectedTab == 1 ? "heart.fill" : "heart")
                        Text("Favorites")
                    }
                }
                .tag(1)
           ProfileView()
                .tabItem {
                    VStack{
                        Image(systemName:selectedTab == 2 ? "person.fill" : "person")
                        Text("Profile")
                    }
                }
                .tag(2)


        }
        
    }
}


#Preview {
    HomeView()
        .environmentObject(OfficeViewModel())
        .environmentObject(FavoritesViewModel())
        .environmentObject(AuthenticationViewModel())
}
