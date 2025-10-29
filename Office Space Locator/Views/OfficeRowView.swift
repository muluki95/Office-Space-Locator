//
//  OfficeView.swift
//  Office Space Locator
//
//  Created by Esther Nzomo on 10/2/25.
//

import SwiftUI
import Kingfisher


struct OfficeRowView : View {
    let office: Office
    
    @EnvironmentObject var viewModel: OfficeViewModel
    
    var body: some View {
        VStack(alignment: .leading, spacing: 2){
            
            ScrollView(.horizontal, showsIndicators: false){
                HStack(spacing: 8){
                    ForEach(office.imageUrls, id:\.self){ url in KFImage(URL(string: url))
                            .placeholder{
                                ProgressView()
                            }
                            .resizable()
                            .scaledToFill()
                            .frame(width: 200, height: 140)
                            .clipShape(RoundedRectangle(cornerRadius: 12))
                            .shadow(radius: 4)
                            
                        
                    }
                    
                }
            }
            Text(office.name)
                .font(.headline)
            
            Text(office.address)
                .font(.subheadline)
                .foregroundStyle(.secondary)
            
            HStack{
                Text("\(office.size) sqft")
                    .font(.caption)
                
                Spacer()
                
                Text(office.available ? "Available" : "Unavailable")
                    .font(.caption)
                    .foregroundStyle(office.available ? .green : .red)
            }
                
                //book now button
                NavigationLink(destination: ConfirmBookView(office: office)){
                    Text("Book Now")
                        .fontWeight(.semibold)
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(office.available ? Color.blue : Color.gray)
                        .foregroundColor(.white)
                        .cornerRadius(8)
                    
                }
            .navigationBarBackButtonHidden()
            .padding(.top, 15)
        }
        .padding()
        .frame(maxWidth: .infinity)
        .background(Color.gray.opacity(0.1))
        .cornerRadius(10)
        
    }
}


//#Preview {
    //OfficeRowView()
    //.environmentObject(OfficeViewModel())
//}
