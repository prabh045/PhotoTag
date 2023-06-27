//
//  AddPhoto-ViewModel.swift
//  PhotoTag
//
//  Created by Prabhdeep Singh on 31/05/23.
//

import Foundation
import UIKit.UIImage
import CoreData

extension AddPhoto {
    @MainActor class ViewModel: ObservableObject {
        @Published var name = ""
        @Published var description = ""
        @Published var selectedImage: UIImage?
        @Published var isShowingImagePicker = false
        
        func saveMemory(objContext: NSManagedObjectContext) {
            guard let selectedImage = selectedImage else {
                return
            }
            let uuid = UUID()
            _ = PhotoModel(id: uuid, name: name, photoDescription: description, image: selectedImage)
            if PhotoSaver.savePhoto(image: selectedImage, id: uuid) {
                let memory = PhotoMemory(context: objContext)
                memory.id = uuid
                memory.photoDescription = description
                memory.name = name
                do {
                    try objContext.save()
                    print("core data saved")
                } catch(let error) {
                    print("error in saving core data \(error.localizedDescription)")
                }
            }
        }
    }
}
