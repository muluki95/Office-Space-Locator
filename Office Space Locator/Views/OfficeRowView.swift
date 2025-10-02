//
//  OfficeView.swift
//  Office Space Locator
//
//  Created by Esther Nzomo on 10/2/25.
//

import SwiftUI


struct OfficeRowView : View {
    let office: Office
    
    var body: some View {
        VStack(alignment: .leading, spacing: 2){
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
            .padding(.top, 15)
        }
        .padding()
        .frame(maxWidth: .infinity)
        .background(Color.gray.opacity(0.1))
        .cornerRadius(10)
        
    }
}


#Preview {
    OfficeRowView(office: Office.sampleData[0])
}
