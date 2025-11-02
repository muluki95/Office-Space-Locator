//
//  InputView.swift
//  Office Space Locator
//
//  Created by Esther Nzomo on 11/1/25.
//

import SwiftUI

struct InputView: View {
    @Binding var text: String
    let title: String
    let placeholder: String
    var isSecureField = false
    var body: some View {
        
        VStack(alignment:.leading, spacing: 5){
            Text(title)
                .foregroundStyle(.gray)
                .fontWeight(.semibold)
                .font(.footnote)
            
            
            if isSecureField {
                SecureField(placeholder, text: $text)
                    .font(.system(size:14))
            } else {
                TextField(placeholder, text: $text)
                    .font(.system(size:14))
                
            }
            
            Divider()
        }
        .padding(.bottom, 12)
        
    }
}


