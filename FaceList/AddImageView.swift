//
//  AddImageView.swift
//  FaceList
//
//  Created by Mehmet Alp Sönmez on 02/07/2024.
//
import CoreImage
import PhotosUI
import SwiftUI

struct AddImageView: View {
    @State private var viewModel : AddImageViewModel
    @Environment(\.dismiss) var dismiss
    
    var onSave: (Photo) -> Void
    
    init(photo: Photo, onSave: @escaping (Photo) -> Void) {
        _viewModel = State(wrappedValue: AddImageViewModel(photo: photo))
        self.onSave = onSave
    }
    
    var body: some View {
        NavigationStack {
            Form{
                Section("Upload Image") {
                    PhotosPicker(selection: $viewModel.selectedImage, matching: .images) {
                        if let image = viewModel.image {
                            Image(uiImage: image)
                                .resizable()
                                .scaledToFit()
                        } else {
                            Text("Select an Image")
                                .foregroundStyle(.gray)
                        }
                    }
                }
                
                Section("Details") {
                    TextField("Name", text: $viewModel.name)
                    TextField("Description", text: $viewModel.description)
                }
                
                Button("Save") {
                    let newPhoto = Photo(image: viewModel.image ?? UIImage(systemName: "photo")!, name: viewModel.name, description: viewModel.description)
                    onSave(newPhoto)
                    dismiss()
                }
                
                
            }
            .navigationTitle("Add Image")
        }
        
    }
}

#Preview {
    AddImageView(photo: Photo(image: UIImage(systemName: "photo")!, name: "photo", description: "test")) { _ in
    }
}
