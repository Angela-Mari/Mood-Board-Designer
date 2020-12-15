//
//  BoardTableViewController.swift
//  Mood-Board-Designer
//  This program computes the display of the main screen of the app. Has functionality for deleting, adding, and rearanging board cells.
//  CPSC 315-01, Fall 2020
//  Final Project
//  Sources:
//      Adjusting row height in Main.storyboard not working: https://stackoverflow.com/questions/46519567/table-view-cell-row-height-doesnt-work
//
//  Created by Angela George on 11/29/20.
//

import UIKit
import CoreData

class BoardTableViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    // MARK: - Properties/IBOutlets
    
    @IBOutlet var tableView: UITableView!
    
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    var boards = [Board]()
    
    // MARK: - Load the View
    
    /**
     Start the program when the view loads
    */
    override func viewDidLoad() {
        super.viewDidLoad()
        
        loadBoards()
    }
    
    // MARK: - Data Management (CRUD, Minus the U)
    
    /**
     Save the boards to the database
    */
    func saveBoards() {
        // Save the context
        do {
            try context.save()
        }
        catch {
            print("Error saving boards \(error)")
        }
        tableView.reloadData()
    }
    
    /**
     Fetches boards from Core Data
     When the app starts, all the boards stored in Core Data are loaded and displayed
    */
    func loadBoards() {
        let request: NSFetchRequest<Board> = Board.fetchRequest()
        do {
            boards = try context.fetch(request)
        }
        catch {
            print("Error loading boards \(error)")
        }
        tableView.reloadData()
    }

    /**
     Deletes a board
     This method is called when the user deletes a board in the table
     
     parameter - tableView: the view in question
              editingStyle: how we wish to edit the data source
              indexPath: the row being deleted
     */
    func deleteBoards(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the board at indexPath.row from the context
            context.delete(boards[indexPath.row])
            boards.remove(at: indexPath.row)
            
            // Show the user that the row is being deleted
            tableView.deleteRows(at: [indexPath], with: .fade)
            
            // Save the context so the delete action persists
            saveBoards()
        }
    }
    
    // MARK: - Display Board Info in Cells
    
    /**
     Resize the cell height (as the field in Main.storyboard isn't doing it)
     
     parameters - tableView: the view in question
               indexPath: row index of the cell being resized
     returns - cell height as a CGIFloat
    */
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 55
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
        
        // Save Board values in a BoardObject (after unwrapping them all)
        // For BoardTableViewCell formatting
        if let titleUnwrapped = board.title, let image1NameUnwrapped = board.image1Name, let image2NameUnwrapped = board.image2Name {
            let boardObject = BoardObject(layoutNumber: Int(board.layoutNumber), title: titleUnwrapped, image1Name: image1NameUnwrapped, image2Name: image2NameUnwrapped)
            cell.update(with: boardObject)
        }
        
        return cell
    }
    
    // MARK: - Edit Mode (Delete and Move Boards)
    
    /**
     Toggle edit mode (rearanging cells around)
     
     parameters - sender: the bar button being pressed
    */
    @IBAction func editButtonPressed(_ sender: UIBarButtonItem) {
        // Toggle editing mode
        let newEditingMode = !tableView.isEditing
        tableView.setEditing(newEditingMode, animated: true)
    }
    
    /**
     Moving rows around in edit mode
     
     parameter - tableView: the view in question
              sourceIndexPath: starting index path
              destinationIndexPath: finishing index path
    */
    func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        // Update our data structure (boards array, in this case)
        let board = boards.remove(at: sourceIndexPath.row)
        boards.insert(board, at: destinationIndexPath.row)
        
        // Refresh the table view
        tableView.reloadData()
    }
    
    /**
     Deleting a row in edit mode
     
     parameter - tableView: the view in question
              editingStyle: how we wish to edit the data source
              indexPath: the row being deleted
    */
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        deleteBoards(tableView, commit: editingStyle, forRowAt: indexPath)
    }
    
    // MARK: - Segues
    
    /**
     Perform a segue to either the detail or add page, sending information with it
     
     parameters - segue: the segue being performed
               sender: may or may not be triggered
    */
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let identifier = segue.identifier {
            if identifier == "DetailSegue" {
                if let boardDetailVC = segue.destination as? BoardDetailViewController {
                    // Get the indexPath for the row the user clicked on
                    // Get the board at that row
                    // Pass the board into detailDetailVC
                    if let indexPath = tableView.indexPathForSelectedRow {
                        let board = boards[indexPath.row]
                        boardDetailVC.boardOptional = board
                    }
                }
            }
            else if identifier == "AddSegue" {
                if let addBoardVC = segue.destination as? AddBoardViewController {
                    if let indexPath = tableView.indexPathForSelectedRow {
                        tableView.deselectRow(at: indexPath, animated: true)
                        //addBoardVC.totalNumBoards = boards.count + 1
                    }
                }
            }
        }
    }
    
    /**
     Segue back to the main screen when the save button is pressed on the add screen
     Add the new board to the data source
     
     parameters - segue: the segue being performed
    */
    @IBAction func unwindToBoardTableViewController(segue: UIStoryboardSegue) {
        if let identifier = segue.identifier {
            if identifier == "SaveUnwindSegue" {
                if let boardDetailVC = segue.source as? AddBoardViewController {
                    if let board = boardDetailVC.boardOptional {
                        // Get the currently selected index path
                        if let indexPath = tableView.indexPathForSelectedRow {
                            // Not needed for this, but can be used if we wanted to edit details
                            //boards[indexPath.row] = board
                        }
                        else { // Unwinding from an AddSegue
                            // Add the new board to the boards array
                            // Make a Board using context
                            let newBoard = Board(context: self.context)
                            newBoard.layoutNumber = Int16(board.layoutNumber)
                            newBoard.title = board.title
                            newBoard.image1Name = board.image1Name
                            newBoard.image2Name = board.image2Name
                            boards.append(newBoard)
                        }
                        // Force update the table view
                        self.saveBoards()
                    }
                }
            }
        }
    }
}
