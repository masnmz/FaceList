//
//  ContentView-ViewModel.swift
//  FaceList
//
//  Created by Mehmet Alp Sönmez on 02/07/2024.
//

import Foundation
import SwiftUI

extension ContentView {
    @Observable
    class ViewModel {
        private(set) var photos : [Photo] = []
         var showingAddImage = false
        
        let savePath = URL.documentsDirectory.appending(path: "SavedImages")
        
        init() {
            do {
                let data = try Data(contentsOf: savePath)
                photos = try JSONDecoder().decode([Photo].self, from: data)
            } catch {
                photos = []
            }
        }
        
        func save() {
            do {
                let data = try JSONEncoder().encode(photos)
                try data.write(to: savePath, options: [.atomic, .completeFileProtection])
            } catch {
                print("Unable to Save Data")
            }
        }
        
        func addPhoto(photo: Photo) {
            photos.append(photo)
            save()
        }
    }
}
