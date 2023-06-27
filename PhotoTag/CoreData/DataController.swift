//
//  DataController.swift
//  PhotoTag
//
//  Created by Prabhdeep Singh on 30/05/23.
//
import CoreData
import Foundation

class DataController {
    let container = NSPersistentContainer(name: "PhotoMemory")
    init() {
        container.loadPersistentStores { description, error in
            guard error == nil else {
                print("error loading persistance store")
                return
            }
        }
    }
}
