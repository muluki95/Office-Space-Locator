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
            ZStack {
                
                /// MAP
                Map(position: $viewModel.mapPosition) {
                    ForEach(viewModel.filteredOffices) { office in
                        Marker(office.name, coordinate: office.coordinate)
                    }
                }
                .ignoresSafeArea()
                
                /// SEARCH + LIST
                VStack(spacing: 12) {
                    
                    SearchBarView()
                        .padding(.horizontal)
                        .padding(.top, 10)
                    
                    Spacer()
                    
                    
            if !viewModel.filteredOffices.isEmpty {
                List(viewModel.filteredOffices) { office in
               OfficeRowView(office: office)
                                            }
                                            .listStyle(.plain)
                                            .frame(maxHeight: 350)
                                            .background(.ultraThinMaterial)
                                            .clipShape(RoundedRectangle(cornerRadius: 20))
                                            .padding(.horizontal)
                                            .transition(.move(edge: .bottom).combined(with: .opacity))
                                            .animation(.easeInOut, value: viewModel.filteredOffices)
                                        }
                                    }
                                }
            .navigationTitle("Find Office Space")
            .navigationBarTitleDisplayMode(.inline)
            
            /// INITIAL LOAD — Firebase only
            .task {
                await viewModel.fetchOffices()
            }
        }
    }
}

#Preview {
    HomeContent()
        .environmentObject(OfficeViewModel())
}
