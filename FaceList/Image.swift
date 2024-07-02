//
//  Image.swift
//  FaceList
//
//  Created by Mehmet Alp Sönmez on 02/07/2024.
//
import Foundation
import SwiftUI

struct Photo: Codable,Comparable,Identifiable {
    var id = UUID()
    var image: UIImage
    var name: String
    var description: String
    
    enum CodingKeys: CodingKey {
            case id, imageData, name, description
        }
    
    init(id: UUID = UUID(), image: UIImage, name: String, description: String) {
            self.id = id
            self.image = image
            self.name = name
            self.description = description
        }
    
    init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            id = try container.decode(UUID.self, forKey: .id)
            let imageData = try container.decode(Data.self, forKey: .imageData)
            guard let decodedImage = UIImage(data: imageData) else {
                throw DecodingError.dataCorruptedError(forKey: .imageData, in: container, debugDescription: "Image data is corrupted")
            }
            image = decodedImage
            name = try container.decode(String.self, forKey: .name)
            description = try container.decode(String.self, forKey: .description)
        }
        
        func encode(to encoder: Encoder) throws {
            var container = encoder.container(keyedBy: CodingKeys.self)
            try container.encode(id, forKey: .id)
            let imageData = image.pngData()
            try container.encode(imageData, forKey: .imageData)
            try container.encode(name, forKey: .name)
            try container.encode(description, forKey: .description)
        }
    
    
    static func <(lhs: Photo, rhs: Photo) -> Bool {
        lhs.name.uppercased() < rhs.name.uppercased()
    }
}
