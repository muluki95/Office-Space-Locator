//
//  FavoritesView.swift
//  Office Space Locator
//
//  Created by Esther Nzomo on 10/2/25.
//
import SwiftUI
import Kingfisher




struct FavoriteView: View {
    
    let favorites: Favorites
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        NavigationStack{
            VStack(alignment: .leading, spacing: 12) {
                ImageScrollerView()
                
                Text(favorites.name)
                    .font(.title2)
                    .fontWeight(.bold)
                
                Text(favorites.location)
                    .foregroundStyle(.secondary)
                
                    
                VStack(alignment:.leading){
                    
                    Text("Size")
                        .font(.subheadline)
                        .foregroundStyle(.secondary)
                    
                    Text("\(favorites.size) sqft")
                        .fontWeight(.bold)
                        }
                        
                VStack(alignment:.leading){
                            Text("Price")
                        .font(.subheadline)
                        .foregroundStyle(.secondary)
                    Text("$\(favorites.price) per month")
                        .fontWeight(.bold)
                            
                        }
                Button {
                    
                } label: {
                    Text("Book Now")
                }
                .frame(maxWidth: .infinity)
                .frame(height: 50)
                .background(Color.blue)
                .foregroundStyle(.white)
                .cornerRadius(10)
                    
                }
                .padding()
                .navigationTitle("Details")
                .navigationBarTitleDisplayMode(.inline)
                .toolbar {
                    ToolbarItem(placement: .navigationBarLeading) {
                                Button(action: { dismiss() }) {
                                    Image(systemName: "chevron.left")
                                        .foregroundColor(.blue)
                                }
                            }
                        }
                
                
            }
            
        }
    }
    

#Preview {
    NavigationStack{
        FavoriteView(favorites: Favorites.mockData[0])
    }
}
