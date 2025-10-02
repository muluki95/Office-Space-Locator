//
//  SearchBar.swift
//  Office Space Locator
//
//  Created by Esther Nzomo on 10/2/25.
//

import SwiftUI


struct SearchBarView: View {
    var body: some View {
        HStack {
            Image(systemName: "magnifyingglass")
            
            VStack(alignment:.leading, spacing: 2){
                Text("Looking for an office space?")
                    .font(.footnote)
                    .fontWeight(.semibold)
                Text("Search for a location")
                    .font(.caption)
                    .foregroundStyle(.gray)
            }
            
            Spacer()
            
            Button(action:{}, label: {
                Image(systemName: "line.3.horizontal.decrease.circle")
                    .foregroundStyle(.black)
            })
        }
        .padding(.horizontal)
        .padding(.vertical, 10)
        .overlay{
            Capsule()
                .stroke(lineWidth: 0.5)
        }
    }
}


#Preview{
    SearchBarView()
}





























































































































































































































































