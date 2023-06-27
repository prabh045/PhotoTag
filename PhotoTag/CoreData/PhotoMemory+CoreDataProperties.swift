//
//  PhotoMemory+CoreDataProperties.swift
//  PhotoTag
//
//  Created by Prabhdeep Singh on 30/05/23.
//
//

import Foundation
import CoreData


extension PhotoMemory {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<PhotoMemory> {
        return NSFetchRequest<PhotoMemory>(entityName: "PhotoMemory")
    }

    @NSManaged public var id: UUID?
    @NSManaged public var photoDescription: String?
    @NSManaged public var name: String?
    
    var wrappedPhotoDescription: String {
        return photoDescription ?? ""
    }
    var wrappedName: String {
        return name ?? ""
    }

}

extension PhotoMemory : Identifiable {

}
