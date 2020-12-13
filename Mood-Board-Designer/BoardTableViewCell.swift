//
//  BoardTableViewCell.swift
//  Mood-Board-Designer
//
//  Created by Elizabeth Larson on 12/3/20.
//

import UIKit

class BoardTableViewCell: UITableViewCell {
    @IBOutlet var nameLabel: UILabel!
    
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
     Display a board's name in a cell
     
     parameters - board: the Board being displayed in a given cell
    */
    func update(with board: Board) {
        //nameLabel.text = board.boardName

        nameLabel.text = board.title

    }
}
