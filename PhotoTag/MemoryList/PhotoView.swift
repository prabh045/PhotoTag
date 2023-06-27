//
//  PhotoView.swift
//  PhotoTag
//
//  Created by Prabhdeep Singh on 18/05/23.
//

import SwiftUI

struct PhotoView: View {
    var image: UIImage?
    var photoName: String
    var photoDescription: String
    var body: some View {
        HStack(spacing: 15) {
            Image(uiImage: image ?? UIImage(named: "placeHolder")!)
                .resizable()
                .frame(width: 150, height: 150)
                .scaledToFit()
                .clipShape(RoundedRectangle(cornerRadius: 10))
            VStack(alignment: .leading, spacing: 5) {
                Text(photoName)
                    .font(.headline)
                Text(photoDescription)
                    .font(.subheadline)
                    .foregroundColor(.gray)
            }
        }
    }
}

struct PhotoView_Previews: PreviewProvider {
    static var previews: some View {
        PhotoView(image: UIImage(named: "placeHolder"), photoName: "Singer", photoDescription: "Hiking")
    }
}
