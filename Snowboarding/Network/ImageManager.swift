//
//  ImageManager.swift
//  Snowboarding
//
//  Created by Максим Зыкин on 25.08.2024.
//

import Foundation

class ImageManager {
    static let shared = ImageManager()
    
    private init() {}
    
//    func fetchImage(from url: String?) -> Data? {
//        guard let url = url else { return nil}
//        guard let imageData = try? Data(contentsOf: URL(string: url)) else { return nil}
//        return imageData
//    }
    
    func fetchImage(from url: URL?) -> Data? {
        guard let url = url else { return nil}
        guard let imageData = try? Data(contentsOf: url) else { return nil}
        return imageData
    }
}
