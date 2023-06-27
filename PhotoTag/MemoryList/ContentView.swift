//
//  ContentView.swift
//  PhotoTag
//
//  Created by Prabhdeep Singh on 18/05/23.
//

import SwiftUI

struct ContentView: View {
    @State private var shouldPresentAddPhoto = false
    @Environment(\.managedObjectContext) var objContext
    @FetchRequest(sortDescriptors: []) var photoMemories: FetchedResults<PhotoMemory>
    var body: some View {
        NavigationView {
            List(photoMemories, id: \.id) { memory in
                let photo = PhotoSaver.getPhoto(for: memory.id!) ?? UIImage(named: "placeHolder")
                PhotoView(image: photo, photoName: memory.wrappedName, photoDescription: memory.wrappedPhotoDescription)
            }
            .navigationTitle("Your Memories")
            .toolbar {
                ToolbarItem {
                    NavigationLink {
                        AddPhoto()
                    } label: {
                        Image(systemName: "plus")
                    }

                }
            }
        }
    }
}

