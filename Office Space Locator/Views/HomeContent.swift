//
//  HomeContent.swift
//  Office Space Locator
//
//  Created by Esther Nzomo on 10/2/25.
//

import SwiftUI



struct HomeContent : View {
    let offices : [Office] = Office.sampleData
    var body: some View {
        NavigationStack {
            VStack(spacing: 12){
            SearchBarView()
            
            Spacer()
           
                List(offices){office in
                    OfficeRowView(office: office)
                }
                .listStyle(.plain)
                .padding(.horizontal)
                
                }
            
            .navigationTitle("Find Office Space")
            .navigationBarTitleDisplayMode(.inline)
            
           
            }
            
            
            
            
        }
        
    }
    

