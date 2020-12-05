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

    @NSManaged public var imageName: String?
    @NSManaged public var title: String?

}

extension Board : Identifiable {

}
