//
//  ChooseBoardLayoutViewController.swift
//  Mood-Board-Designer
//
//  Created by Elizabeth Larson on 12/3/20.
//

import UIKit

class ChooseBoardLayoutViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    // MARK: - Segues
    
    /**
     Perform a segue to either the add page page, sending the layout number chosen with it
     
     parameters - segue: the segue being performed
               sender: may or may not be triggered
    */
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let identifier = segue.identifier {
            if identifier == "Layout1Segue" {
                if let addBoardVC = segue.destination as? AddBoardViewController {
                    addBoardVC.layoutNumber = 1
                }
            }
            else if identifier == "Layout2Segue" {
                if let addBoardVC = segue.destination as? AddBoardViewController {
                    addBoardVC.layoutNumber = 2
                }
            }
        }
    }

}
