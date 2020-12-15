//
//  BoardDetailViewController.swift
//  Mood-Board-Designer
//  This program computes the logic for showing the details (board title and imagen name) of a board.
//  CPSC 315-01, Fall 2020
//  Final Project
//  No sources to cite.
//
//  Created by Elizabeth Larson on 12/13/20.
//

import UIKit

class BoardDetailViewController: UIViewController {
    // MARK: - Properties/IBOutlets
    
    var boardOptional: Board? = nil
    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var boardImageView1: UIImageView!
    @IBOutlet var boardImageView2: UIImageView!
    
    // MARK: - Save to widget
    
    @IBAction func displayWidget(_ sender: UIButton) {
            
        print("saving moodboard config")
            
        //convert one image
        let imageData = boardImageView1?.image?.jpegData(compressionQuality: 0.5)
        let imageBase64String1 = imageData?.base64EncodedString()
            
        //convert second image
        let imageData2 = boardImageView2?.image?.jpegData(compressionQuality: 0.5)
        let imageBase64String2 = imageData2?.base64EncodedString()
            
            
            print(imageBase64String1 ?? "nope")
            
        let mood = Mood(title: titleLabel.text ?? "could not unwrap", image1: imageBase64String1 ?? "placeholder", image2: imageBase64String2 ?? "placeholder")
            
            
            Mood.saveMoodsToFile(moods: [mood])
        print("saved")
        }
    
    // MARK: - Load the View
    
    /**
     Start the program when the view loads
    */
    override func viewDidLoad() {
        super.viewDidLoad()
        displayBoard()
    }
    
    /**
     Updates the text of the labels appropriately based on the Trip the UI is going to display the details for
    */
    func displayBoard() {
        
        if let board = boardOptional {
            print("inside board optional")
            
            titleLabel.text = board.title
            
            // get documentDirectoryPath
            let documentsDirectoryURL = FileManager.default.urls(for: .documentDirectory, in : .userDomainMask).first!
            
            //get first image from disk
            let url = documentsDirectoryURL.appendingPathComponent(board.image1Name ?? "placeholder").appendingPathExtension("plist")
            print(url)
            let imageFromDisk = UIImage(contentsOfFile: url.path)
            boardImageView1.image = imageFromDisk
                
            //get second image from disk
            let url2 = documentsDirectoryURL.appendingPathComponent(board.image2Name ?? "placeholder").appendingPathExtension("plist")
            print(url2)
            let image2FromDisk = UIImage(contentsOfFile: url2.path)
            
            boardImageView2.image = image2FromDisk
        }
    }
}
