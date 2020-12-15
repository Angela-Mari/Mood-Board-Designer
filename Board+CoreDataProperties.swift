//
//  Board+CoreDataProperties.swift
//  Mood-Board-Designer
//
//  Created by Angela George on 12/5/20.
//
//

import Foundation
import CoreData


extension Board {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Board> {
        return NSFetchRequest<Board>(entityName: "Board")
    }

    @NSManaged public var layoutNumber: Int16
    @NSManaged public var title: String?
    @NSManaged public var image1Name: String?
    @NSManaged public var image2Name: String?

}

extension Board : Identifiable {

}
