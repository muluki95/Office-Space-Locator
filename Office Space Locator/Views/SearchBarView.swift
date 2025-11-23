//
//  SearchBar.swift
//  Office Space Locator
//
//  Created by Esther Nzomo on 10/2/25.
//

import SwiftUI


struct SearchBarView: View {
    
    @EnvironmentObject var viewModel: OfficeViewModel
    
    
    var body: some View {
        HStack {
            TextField("Search by location",text: $viewModel.searchText )
                .padding()
                .background(Color(.systemGray6))
                .cornerRadius(10)
            
            Spacer()
            
            Button{
                viewModel.searchByLocation()
                
            } label: {
                Image(systemName: "magnifyingglass")
                    .padding()
                
            }
        }
        .padding(.horizontal, 10)
    }
    
}


#Preview{
    SearchBarView()
        .environmentObject(OfficeViewModel())
}





























































































































































































































































