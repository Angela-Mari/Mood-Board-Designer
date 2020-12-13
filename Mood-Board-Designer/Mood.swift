//
//  Mood.swift
//  Mood-Board-Designer
//
//  Created by Angela George on 12/12/20.
//

import Foundation

//store info from moodboard into Mood struct to save to plist
class Mood : Identifiable, Codable{
   
    let title : String
    let image1 : String
    let image2: String
    
    var id: String {title}
    
    static let pListURL: URL? = {
       // initizalization closure
        let containerURL = FileManager.default.containerURL(forSecurityApplicationGroupIdentifier: "group.MoodBoardDesignerGroup")
        // userDomainMask refers to current user's home directory
        // this statment returns the first directory of an array of directory
        if let fileURL = containerURL?.appendingPathComponent("moods.plist"){
            return fileURL
        }
        return nil
    }()

    init(title: String, image1: String, image2: String) {
        self.title = title
        self.image1 = image1
        self.image2 = image2
    }

    static func saveMoodsToFile(moods: [Mood]){
        let encoder = PropertyListEncoder()
        
        if let moodsData = try? encoder.encode(moods) {
            try? moodsData.write(to: pListURL!)
            print("saved!")
        }
    }

    static func loadMoodsFromFile()-> [Mood]?{
        let decoder = PropertyListDecoder()
        
        if let moodsData = try? Data(contentsOf: pListURL!), let decodedMoods = try? decoder.decode([Mood].self, from: moodsData) {
            return decodedMoods
        }
        return nil
    }
}



