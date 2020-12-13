//
//  TestDetailViewController.swift
//  Mood-Board-Designer
//
//  Created by Angela George on 12/12/20.
//

import UIKit

//if this was the detail view of a selected mood board we would have an image and text passed from Core Data
class TestDetailViewController: UIViewController {

    let mood = Mood(title: "Testing 2 images...", image1: "test", image2: "test2")
    
    @IBAction func displayWidget(_ sender: UIButton) {
        
        print("saving moodboard config")
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
