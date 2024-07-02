//
//  ContentView.swift
//  FaceList
//
//  Created by Mehmet Alp Sönmez on 02/07/2024.
//

import SwiftUI

struct ContentView: View {
    @State var photos : [Photo] = []
    @State private var showingAddImage = false
    var body: some View {
        NavigationStack {
            VStack {
                if photos.isEmpty {
                    VStack {
                        ContentUnavailableView("No Photos", systemImage: "photo", description: Text("Do not have Photos. Add photos to see here"))
                    }
                } else {
                    List{
                        ForEach(photos) { photo in
                            Text(photo.name)
                        }
                    }
                }
            }
            .navigationTitle("FaceList")
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button("Add Image", systemImage: "plus") {
                        showingAddImage.toggle()
                    }
                }
            }
            .sheet(isPresented: $showingAddImage) {
                AddImageView()
            }
        }
        
        
    }
}

#Preview {
    ContentView()
}
