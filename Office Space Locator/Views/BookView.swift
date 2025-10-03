//
//  BookView.swift
//  Office Space Locator
//
//  Created by Esther Nzomo on 10/3/25.
//
import SwiftUI


struct BookView: View {
    let office: Favorites
    
    @Environment(\.dismiss) private var dismiss
    @State private var startDate: Date = Date()
    @State private var endDate: Date = Date()
    @State private var showConfirmation = false
    var body: some View {
        NavigationStack {
            VStack{
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
                        Text("Estimated Cost")
                        
                        Spacer()
                        
                        Text("120dollars")
                        
                    }
                    .padding(.vertical)
                
                
                //confirm button
                Button(action: {
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
                    
                }
            } message: {
                Text("You booked \(office.name) for $1200")
                
            }
            
        }
        
        
    }
}


#Preview {
    BookView(office: Favorites.mockData[0])
}
