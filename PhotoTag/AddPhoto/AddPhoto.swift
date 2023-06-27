//
//  AddPhoto.swift
//  PhotoTag
//
//  Created by Prabhdeep Singh on 18/05/23.
//

import SwiftUI

struct AddPhoto: View {
    @StateObject var addPhotoViewmodel = ViewModel()
    @Environment(\.managedObjectContext) var objContext
    @Environment(\.dismiss) var dismiss
    var body: some View {
        ScrollView {
            VStack(alignment: .center) {
                Image(uiImage:  addPhotoViewmodel.selectedImage ?? UIImage(named: "place")!)
                    .resizable()
                    .scaledToFit()
                    .onTapGesture {
                        addPhotoViewmodel.isShowingImagePicker = true
                    }
                    .sheet(isPresented: $addPhotoViewmodel.isShowingImagePicker) {
                        PhotoPicker(image: $addPhotoViewmodel.selectedImage)
                    }
                VStack(alignment: .leading, spacing: 10) {
                    Text("Enter Your Name")
                        .foregroundColor(.gray)
                        .font(.title2)
                    TextField("Your name", text: $addPhotoViewmodel.name)
                    Text("Photo Description")
                        .foregroundColor(.gray)
                        .font(.title2)
                    TextField("Went Hiking, restaurant dinner, party etc", text: $addPhotoViewmodel.description)
                }
                Button("Save") {
                    addPhotoViewmodel.saveMemory(objContext: objContext)
                    dismiss()
                }
                .padding()
                .background(.blue)
                .clipShape(RoundedRectangle(cornerRadius: 10))
                .foregroundColor(.white)

            }
        }
        .navigationTitle("Add a new Memory")
    }
}

struct AddPhoto_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            AddPhoto()
        }
    }
}
