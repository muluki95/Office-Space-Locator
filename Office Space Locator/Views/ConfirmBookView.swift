//
//  BookView.swift
//  Office Space Locator
//
//  Created by Esther Nzomo on 10/3/25.
//
import SwiftUI


struct ConfirmBookView: View {
    let office: Office
    @EnvironmentObject var viewModel: OfficeViewModel
    @EnvironmentObject var favoritesViewModel: FavoritesViewModel
    @Environment(\.dismiss) var dismiss
    
    @State private var startDate: Date = Date()
    @State private var endDate: Date = Date()
    @State private var showConfirmation = false
    var body: some View {
        NavigationStack {
            VStack(spacing:20){
                DatePicker("Start Date", selection: $startDate, displayedComponents: .date )
                    .frame(maxWidth: .infinity)
                    .frame(height: 80)
                    .background(Color.blue.opacity(0.2))
                    .cornerRadius(10)
                
                DatePicker("End Date", selection: $endDate, in: startDate..., displayedComponents: .date)
                    .frame(maxWidth: .infinity)
                    .frame(height: 80)
                    .background(Color.blue.opacity(0.2))
                    .cornerRadius(10)
                
                Divider()
                    
               
                    HStack( spacing: 8){
                        Text("Monthly Price")
                            .font(.headline)
                                           
                        Spacer()
                                           
                        Text("$\(office.price)")
                        .fontWeight(.semibold)
                        
                    }
                    .padding(.vertical)
                
                
                //confirm button
                Button(action: {
                    favoritesViewModel.confirmBooking(office: office)
                    showConfirmation = true
                    
                    
                }) {
                    Text("Confirm Booking")
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color.blue)
                        .foregroundStyle(.white)
                        .cornerRadius(10)
                }
                .padding(.top)
                
                

                
            }
            .padding(.horizontal)
            .navigationTitle("Book")
            .navigationBarTitleDisplayMode(.inline)
            .navigationBarBackButtonHidden()
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                            Button(action: { dismiss() }) {
                                Image(systemName: "chevron.left")
                                    .foregroundColor(.blue)
                            }
                        }
                    }
            .alert("Booking Confirmed", isPresented: $showConfirmation){
                Button("OK", role:.cancel){
                    dismiss()
                    
                }
            } message: {
                Text("You booked \(office.name) for $\(office.price) per month")
                
            }
            
        }
        
        
    }
}


