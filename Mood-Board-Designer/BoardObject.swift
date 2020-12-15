//
//  BoardObject.swift
//  Mood-Board-Designer
//  This program computes BaordObject objects. BoardObjects represent a board that a user has made (a layout number, a title, a possible image, and a string desscriptions used for debugging purposes).
//  CPSC 315-01, Fall 2020
//  Final Project
//  No sources to cite for this file.
//
//  Created by Elizabeth Larson on 12/13/20.
//

import Foundation

class BoardObject: CustomStringConvertible {
    // MARK: - Properties
    
    var layoutNumber: Int // Layout the user chooses (1 or 2)
    var title: String // The board's name
    // The name of the image files
    var image1Name: String?
    var image2Name: String?
    var description: String { // Returns a string description of a BoardObject
        // Unwrap in case image names are nil
        if let image1NameUnwrapped = image1Name, let image2NameUnwrapped = image2Name {
            return "Layout Number: \(layoutNumber) - Title: \(title) - Image 1 File Name: \(image1NameUnwrapped) - Image 2 File Name: \(image2NameUnwrapped)"
        }
        else {
            return "Layout Number: \(layoutNumber) - Title: \(title) - One or more of the image names are nil"
        }
    }
    
    // MARK: - Initializer(s)
    
    /**
     Initialize all properties
    */
    init(layoutNumber: Int, title: String, image1Name: String, image2Name: String) {
        self.layoutNumber = layoutNumber
        self.title = title
        self.image1Name = image1Name
        self.image2Name = image2Name
    }
}
