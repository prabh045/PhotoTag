//
//  PhotoSaver.swift
//  PhotoTag
//
//  Created by Prabhdeep Singh on 30/05/23.
//

import UIKit

class PhotoSaver {
    static func savePhoto(image: UIImage, id: UUID) -> Bool {
        let urls = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        guard let savePath = urls.first?.appendingPathComponent("\(id)") else {
            return false
        }
        if let jpeg = image.jpegData(compressionQuality: 0.8) {
            do {
                try jpeg.write(to: savePath)
                print("saved photo")
                return true
            } catch(let error) {
                print("error in saving photo \(error.localizedDescription)")
                return false
            }
        }
        return false
    }
    static func getPhoto(for path: UUID) -> UIImage? {
        let urls = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        guard let savePath = urls.first?.appendingPathComponent("\(path)") else {
            return nil
        }
        guard let data = try? Data(contentsOf: savePath) else {
            return nil
        }
        guard let image = UIImage(data: data) else {
            return nil
        }
        return image
    }
}
