//
//  TestDetailViewController.swift
//  Mood-Board-Designer
//
//  Created by Angela George on 12/12/20.
//

import UIKit

//if this was the detail view of a selected mood board we would have an image and text passed from Core Data
class TestDetailViewController: UIViewController {

    let testImage = UIImage(named: "test3.jpeg")
    let testImage2 = UIImage(named: "test2.jpeg")
    
    @IBAction func displayWidget(_ sender: UIButton) {
        
        
        
        print("saving moodboard config")
        
        
        //convert one image
        let imageData = testImage?.jpegData(compressionQuality: 1)
        let imageBase64String1 = imageData?.base64EncodedString()
        
        //convert second image
        let imageData2 = testImage2?.jpegData(compressionQuality: 1)
        let imageBase64String2 = imageData2?.base64EncodedString()
        
        
        print(imageBase64String1 ?? "nope")
        
        let mood = Mood(title: "write images...", image1: imageBase64String1 ?? "placeholder", image2: imageBase64String2 ?? "placeholder")
        
        // Obtaining the Location of the Documents Directory
//        let containerURL = FileManager.default.containerURL(forSecurityApplicationGroupIdentifier: "group.MoodBoardDesignerGroup")
//        // userDomainMask refers to current user's home directory
//        // this statment returns the first directory of an array of directory
//        if let fileURL = containerURL?.appendingPathComponent("test3.jpeg"){
//             // Convert to Data
//            if let data = image?.jpegData(compressionQuality: 1){
//                do {
//                    try data.write(to: fileURL)
//                } catch {
//                    print("Unable to Write Image Data to Disk")
//                }
//            }
//            
//        }
        
        Mood.saveMoodsToFile(moods: [mood])
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
