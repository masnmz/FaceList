//
//  ContentView.swift
//  FaceList
//
//  Created by Mehmet Alp Sönmez on 02/07/2024.
//

import SwiftUI

struct ContentView: View {
    @State private var viewModel = ViewModel()
    var body: some View {
        NavigationStack {
            VStack {
                if viewModel.photos.isEmpty {
                    VStack {
                        ContentUnavailableView("No Photos", systemImage: "photo", description: Text("Do not have Photos. Add photos to see here"))
                    }
                } else {
                    List{
                        ForEach(viewModel.photos.sorted()) { photo in
                            NavigationLink(destination: DetailView(photo: photo)) {
                                HStack{
                                    Image(uiImage: photo.image)
                                        .resizable()
                                        .frame(width: 100, height: 100)
                    
                                    Text(photo.name)
                                }
                            }
                        }
                        .listRowBackground(Color.lightBackground)
                    }
                }
            }
            .navigationTitle("FaceList")
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button("Add Image", systemImage: "plus") {
                        viewModel.showingAddImage.toggle()
                    }
                }
            }
            .sheet(isPresented: $viewModel.showingAddImage) {
                AddImageView(photo: Photo(image: UIImage(systemName: "photo")!, name: "", description: ""), onSave: { newPhoto in
                    viewModel.addPhoto(photo: newPhoto)
                    viewModel.save()
                })
            }
            .scrollContentBackground(.hidden)
            .background(.darkBackGround)
            .preferredColorScheme(.dark)
        }
        
        
    }
}

#Preview {
    ContentView()
}
