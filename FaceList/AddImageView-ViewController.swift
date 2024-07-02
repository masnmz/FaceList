//
//  AddImageView-ViewController.swift
//  FaceList
//
//  Created by Mehmet Alp Sönmez on 02/07/2024.
//
import CoreImage
import Foundation
import PhotosUI
import SwiftUI

extension AddImageView {
    @Observable
    class AddImageViewModel {
        var photo: Photo
        var name: String
        var image: UIImage?
        var description: String
        
        var selectedImage : PhotosPickerItem? {
            didSet {
                loadImage()
            }
        }
        
        init(photo: Photo) {
            self.photo = photo
            self.name = photo.name
            self.image = photo.image
            self.description = photo.description
        }
        
        func loadImage() {
            Task {
                guard let imageData = try await selectedImage?.loadTransferable(type: Data.self) else { return }
                guard let inputImage = UIImage(data: imageData) else { return }
                await MainActor.run {
                    self.image = inputImage
                }
            }
        }
        
    }
}
