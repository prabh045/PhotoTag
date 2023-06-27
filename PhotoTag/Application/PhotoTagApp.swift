//
//  PhotoTagApp.swift
//  PhotoTag
//
//  Created by Prabhdeep Singh on 18/05/23.
//

import SwiftUI

@main
struct PhotoTagApp: App {
    var controller = DataController()
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, controller.container.viewContext)
        }
    }
}
