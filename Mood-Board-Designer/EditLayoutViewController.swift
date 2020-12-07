//
//  EditLayoutViewController.swift
//  Mood-Board-Designer
//
//  Created by Elizabeth Larson on 12/7/20.
//

import UIKit

class EditLayoutViewController: UIViewController {
    // Layout number
    @IBOutlet var layoutNumberLabel: UILabel!
    
    // Board name
    @IBOutlet var boardNameTextField: UITextField!
    
    // Photo image views
    @IBOutlet var photo1ImageView: UIImageView!
    @IBOutlet var photo2ImageView: UIImageView!
    @IBOutlet var photo3ImageView: UIImageView!
    @IBOutlet var photo4ImageView: UIImageView!
    
    
    // Photo (camera) buttons
    @IBAction func photo1Button(_ sender: UIButton) {
    }
    @IBAction func photo2Button(_ sender: UIButton) {
    }
    @IBAction func photo3Button(_ sender: UIButton) {
    }
    @IBAction func photoButton4(_ sender: Any) {
    }
    
    // YouTube functionality?
    
    // Saving the board
    @IBAction func saveButton(_ sender: UIButton) {
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
}
