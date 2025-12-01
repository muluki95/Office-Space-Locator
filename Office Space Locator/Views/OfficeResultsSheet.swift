//
//  OfficeResultsSheet.swift
//  Office Space Locator
//
//  Created by Esther Nzomo on 11/30/25.
//

import SwiftUI



struct OfficeResultsSheet: View {
    
    @EnvironmentObject var viewModel: OfficeViewModel
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(spacing: 16) {
                    ForEach(viewModel.offices){ office in
                        OfficeRowView(office: office)
                    }
                    
                    
                }
                .padding()
            }
            .navigationTitle("Available Offices")
        }
        
    }
}
