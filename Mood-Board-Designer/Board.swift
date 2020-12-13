//
//  Board.swift
//  Mood-Board-Designer
//
//  Created by Elizabeth Larson on 12/3/20.
//

import Foundation

class Board {
    var layoutNumber: Int
    var boardName: String
    var image1FileName: String?
    var image2FileName: String?
    var image3FileName: String?
    var image4FileName: String?
    
    /**
     Initialize all properties
    */
    init(layoutNumber: Int, boardName: String, image1FileName: String?, image2FileName: String?, image3FileName: String?, image4FileName: String?) {
        self.layoutNumber = layoutNumber
        self.boardName = boardName
        self.image1FileName = image1FileName
        self.image2FileName = image2FileName
        self.image3FileName = image3FileName
        self.image4FileName = image4FileName
    }
}
