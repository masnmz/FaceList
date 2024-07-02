//
//  Image.swift
//  FaceList
//
//  Created by Mehmet Alp Sönmez on 02/07/2024.
//
import Foundation
import SwiftUI

struct Photo: Identifiable {
    var id = UUID()
    var image: UIImage
    var name: String
    var description: String
}
