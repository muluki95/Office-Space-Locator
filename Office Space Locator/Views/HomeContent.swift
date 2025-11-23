//
//  HomeContent.swift
//  Office Space Locator
//
//  Created by Esther Nzomo on 10/2/25.
//

import SwiftUI
import MapKit



struct HomeContent : View {
    //let offices : [Office] = Office.sampleData
    
    @EnvironmentObject var viewModel: OfficeViewModel
    
    var body: some View {
        NavigationStack {
            ZStack{
                Map(position: $viewModel.mapPosition)
                    { ForEach(viewModel.filteredOffices){office in
                    Marker(office.name, coordinate: office.coordinate)
                    
                }
                    
                }
                 .ignoresSafeArea()
                    
                VStack(spacing: 12){
                    SearchBarView()
                        .padding()
                    
                    Spacer()
                    
                    List(viewModel.filteredOffices){office in
                        OfficeRowView(office: office)
                    }
                    .listStyle(.plain)
                    .frame(maxHeight: 350)
                    .background(.ultraThinMaterial)
                    .clipShape(RoundedRectangle(cornerRadius: 20))
                    .padding(.horizontal)
                    
                }
            }
            .navigationTitle("Find Office Space")
            .navigationBarTitleDisplayMode(.inline)
            .task{
                await viewModel.fetchOffices()
            }
            
           
            }
            
            
            
            
        }
        
    }
    

#Preview {
    HomeContent()
        .environmentObject(OfficeViewModel())
}

