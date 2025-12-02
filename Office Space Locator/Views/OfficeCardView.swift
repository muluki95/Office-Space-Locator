//
//  OfficeCardView.swift
//  Office Space Locator
//
//  Created by Esther Nzomo on 10/23/25.
//

import SwiftUI
import Kingfisher



struct OfficeCardView: View {
    
    @State var office: Favorites
    @EnvironmentObject var viewModel: OfficeViewModel
    @EnvironmentObject var favoritesViewModel: FavoritesViewModel
    @State private var showDeleteAlert = false
    
    var body: some View {
        VStack(alignment: .leading, spacing: 10){
            ImageScrollerView(imageUrls: office.imageURL)
                .frame(width: 350, height: 200)
            
            HStack {
                VStack(alignment: .leading, spacing: 5) {
                    Text(office.name)
                        .font(.headline)
                    
                    Text(office.location)
                        .font(.subheadline)
                        .foregroundStyle(.secondary)
                }
                Spacer()
                
                //favorite heart icon
                Button{
                    office.isFavorite.toggle()
                } label: {
                    Image(systemName: office.isFavorite ? "heart.fill" : "heart")
                        .foregroundColor(office.isFavorite ? .red : .gray)
                        .font(.system(size: 20))
                    
                }
                .buttonStyle(PlainButtonStyle())
                
                //Delete button
                Button {
                    showDeleteAlert = true
                } label: {
                    Image(systemName: "trash")
                    .foregroundColor(.red)
                    .font(.system(size: 20))
                }
                .buttonStyle(PlainButtonStyle())
                .padding(.leading, 8)
                
            }
            
            HStack{
                Text("\(office.size)sqft")
                    .font(.caption)
                
                
                Spacer()
                
                Text("\(office.price)/month")
                    .font(.caption)
                    .foregroundStyle(.secondary)
            }
            
        }
        .padding()
        .alert("Remove Favorites?", isPresented: $showDeleteAlert){
            Button("Delete", role: .destructive){
                favoritesViewModel.deleteFavorites(office)
                
            }
            Button("Cancel", role:.cancel){}
        } message: {
            Text("This office space will be removed from your favorites.")
        }
        
        
    }
}

/**
#Preview{
    OfficeCardView(office: Office)
        .environmentObject(OfficeViewModel())
        .environmentObject(FavoritesViewModel())
}
**/
