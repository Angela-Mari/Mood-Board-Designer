//
//  BoardTableViewController.swift
//  Mood-Board-Designer
//
//  Created by Angela George on 11/29/20.
//

import UIKit

class BoardTableViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    @IBOutlet var tableView: UITableView!
    var boards = [Board]() // Collection of boards (data set)
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    /**
     Give the table view the number of rows in this section
     
     parameters - tableView: the view in question
               section: the selection of data we're looking for the size of
     returns - the number of cells in the data source
    */
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return boards.count
        }
        return 0 // Has 0 rows
    }
    
    /**
     Give the table view what cell should be displayed at a given index path
     
     parameters - tableView: the view in question
               indexPath: get the section number and row number (cooresponds to an index in boards array)
     returns - the desired cell
    */
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // Get a refrerence to an object of type BoardTableViewCell
        let cell = tableView.dequeueReusableCell(withIdentifier: "BoardCell", for: indexPath) as! BoardTableViewCell
        let board = boards[indexPath.row]
        
        // Save Boards values in a Board
        // For BoardTableViewCell formatting
        let boardName = Board(name: board.name)
        cell.update(with: boardName)
        
        return cell
    }
    
    // Edit mode (rearrange and delete) (navigation bar)????
    // Add a new board (navigation bar)
    
}
