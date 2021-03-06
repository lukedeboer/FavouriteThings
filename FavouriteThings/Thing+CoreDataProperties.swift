//
//  Thing+CoreDataProperties.swift
//  FavouriteThings
//
//  Created by Luke De boer on 3/5/20.
//  Copyright © 2020 Luke De boer. All rights reserved.
//
//

import Foundation
import CoreData


extension Thing {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Thing> {
        return NSFetchRequest<Thing>(entityName: "Thing")
    }

    @NSManaged public var height: String?
    @NSManaged public var heightLabel: String?
    @NSManaged public var imageLabel: String?
    @NSManaged public var imageName: String?
    @NSManaged public var imageURL: String?
    @NSManaged public var name: String?
    @NSManaged public var notes: String?
    @NSManaged public var notesLabel: String?
    @NSManaged public var status: String?
    @NSManaged public var statusLabel: String?
    @NSManaged public var weight: String?
    @NSManaged public var weightLabel: String?
    @NSManaged public var thing: Things?

}
