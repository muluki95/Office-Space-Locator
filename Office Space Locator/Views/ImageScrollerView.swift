//
//  ImageScrollerView.swift
//  Office Space Locator
//
//  Created by Esther Nzomo on 10/3/25.
//

import SwiftUI
import Kingfisher



struct ImageScrollerView: View {
    let imageUrls: [String]
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false){
            HStack(spacing: 20) {
                ForEach(imageUrls, id: \.self) { url in
                    KFImage(URL(string: url))
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
            .padding(.horizontal,12)
        }
    }
}
#Preview {
    ImageScrollerView(imageUrls: ["https://images.unsplash.com/photo-1730448119075-41e62eb4f6d8?w=900&auto=format&fit=crop&q=60&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MjB8fHZhY2FudCUyMGVtcHR5JTIwb2ZmaWNlcyUyMGZvciUyMGxlYXNlfGVufDB8fDB8fHww",
        "https://images.unsplash.com/photo-1582653291997-079a1c04e5a1?w=900&auto=format&fit=crop&q=60&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8Y29uZmVyZW5jZSUyMHJvb218ZW58MHx8MHx8fDA%3D",
        "https://images.unsplash.com/photo-1651442897558-47cff0f64bd9?w=900&auto=format&fit=crop&q=60&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Nnx8b2ZmaWNlJTIwYmF0aHJvb21zfGVufDB8fDB8fHww"])
}
