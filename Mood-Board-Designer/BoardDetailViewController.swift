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
            // Update text labels with correct information
            titleLabel.text = board.title
            if let image1 = board.image1Name {
                boardImageView1.image = UIImage(named: image1)
            }
            if let image2 = board.image2Name {
                boardImageView2.image = UIImage(named: image2)
            }
        }
    }
}
