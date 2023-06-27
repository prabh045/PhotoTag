//
//  PhotoPicker.swift
//  PhotoTag
//
//  Created by Prabhdeep Singh on 30/05/23.
//

import SwiftUI
import PhotosUI

struct PhotoPicker: UIViewControllerRepresentable {
    @Binding var image: UIImage?
    class Coordinator: NSObject, PHPickerViewControllerDelegate {
        var photoPicker: PhotoPicker
        init(photoPicker: PhotoPicker) {
            self.photoPicker = photoPicker
        }
        func picker(_ picker: PHPickerViewController, didFinishPicking results: [PHPickerResult]) {
            guard let provider = results.first?.itemProvider else {
                return
            }
            if provider.canLoadObject(ofClass: UIImage.self) {
                provider.loadObject(ofClass: UIImage.self) { image, _ in
                    Task { @MainActor in
                        self.photoPicker.image = image as? UIImage
                    }
                }
            }
            picker.dismiss(animated: true)
        }
    }
    func makeUIViewController(context: Context) -> PHPickerViewController {
        var config = PHPickerConfiguration()
        config.filter = .images
        let vc = PHPickerViewController(configuration: config)
        vc.delegate = context.coordinator
        return vc
    }
    func updateUIViewController(_ uiViewController: PHPickerViewController, context: Context) {
        print("called")
    }
    func makeCoordinator() -> Coordinator {
        Coordinator(photoPicker: self)
    }
    typealias UIViewControllerType = PHPickerViewController
}
