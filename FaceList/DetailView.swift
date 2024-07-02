//
//  DetailView.swift
//  FaceList
//
//  Created by Mehmet Alp Sönmez on 02/07/2024.
//

import SwiftUI

struct DetailView: View {
    var photo: Photo
    
    var body: some View {
        NavigationStack {
            VStack {
                Image(uiImage: photo.image)
                    .resizable()
                    .scaledToFit()
                    .frame(maxWidth: .infinity , maxHeight: .infinity)
                    .padding()
                
                Text(photo.description)
                    .font(.body)
                    .padding()
            }
            .navigationTitle(photo.name)
            .navigationBarTitleDisplayMode(.inline)
            .background(.darkBackGround)
        }
    }
}

#Preview {
    DetailView(photo: Photo(image: UIImage(systemName: "photo")!, name: "Sample Photo", description: "This is a sample description"))
}
