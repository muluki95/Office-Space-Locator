//
//  HomeContent.swift
//  Office Space Locator
//

import SwiftUI
import MapKit

struct HomeContent: View {
    
    @EnvironmentObject var viewModel: OfficeViewModel
    
    var body: some View {
        NavigationStack {
            ZStack(alignment: .top) {
                
                /// MAP
                Map(coordinateRegion: $viewModel.region, annotationItems: viewModel.mapAnnotations){
                    annotation in
                    
                    MapPin(coordinate: annotation.coordinate, tint: .red)
                }
                    .ignoresSafeArea()
                
                /// SEARCH + LIST
                VStack(spacing: 12) {
                    
                    SearchBarView()
                        .padding(.horizontal)
                        .padding(.top, 10)
                    
                    Spacer()
                    
                    
                }
                .sheet(isPresented : $viewModel.showResultsSheet){
                     OfficeResultsSheet()
                        .environmentObject(viewModel)
                        .presentationDetents([.medium])
                        .presentationDragIndicator(.visible)
                    
                }
                
            }
        }
    }
}
#Preview {
        
    HomeContent()
            .environmentObject(OfficeViewModel())
}


