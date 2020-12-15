//
//  BoardTableViewCell.swift
//  Mood-Board-Designer
//  This program creates a custom cell that displays board information.
//  CPSC 315-01, Fall 2020
//  Final Project
//  No sources to cite.
//
//  Created by Elizabeth Larson on 12/3/20.
//

import UIKit

class BoardTableViewCell: UITableViewCell {
    // MARK: - Properties/IBOutlets
    
    @IBOutlet var titleLabel: UILabel!
    
    // MARK: - Load the View
    
    /**
     Created with file
    */
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    /**
     Created with file
    */
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

    /**
     Display a board's properties (title and image) in a cell
     
     parameters - board: the Board being displayed in a given cell
    */
    func update(with board: BoardObject) {
        titleLabel.text = board.title
    }
}
