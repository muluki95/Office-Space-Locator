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
                Map(coordinateRegion: $viewModel.region)
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
                    
                }
            }
        }
    }
}
#Preview {
        
    HomeContent()
            .environmentObject(OfficeViewModel())
}


