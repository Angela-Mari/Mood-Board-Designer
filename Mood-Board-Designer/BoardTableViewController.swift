//
//  BoardTableViewController.swift
//  Mood-Board-Designer
//
//  Created by Angela George on 11/29/20.
//

import UIKit
import CoreData

class BoardTableViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet var tableView: UITableView!
    var boards = [Board]() // Collection of boards (data set)

    //let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext

    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext

    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadBoards()
    }
    
    func saveBoards() {
        // we want to save the context "to disk" (db)
        do {
            try context.save() // like git commit
        }
        catch {
            print("Error saving Boards \(error)")
        }
        tableView.reloadData()
    }
    
    /**
        Read of CRUD, loads boards from disk
     */
    func loadBoards() {
        // we need to make a "request" to get the Category objects
        // via the persistent container
        let request: NSFetchRequest<Board> = Board.fetchRequest()
        // with a sql SELECT statement we usually specify a WHERE clause if we want to filter rows from the table we are selecting from
        // if we want to filter, we need to add a "predicate" to our request... we will do this later for Items
        do {
            boards = try context.fetch(request)
        }
        catch {
            print("Error loading Boards \(error)")
        }
        tableView.reloadData()
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
        let row = indexPath.row
        let board = boards[row]
        
        // now we need a DogTableViewCell!!
        let cell = tableView.dequeueReusableCell(withIdentifier: "BoardCell", for: indexPath) as! BoardTableViewCell
        // we don't need to create a "new cell" for each our dogs and here is why
        // lets say there are 10000 dogs in our dogs array
        // we don't need 100000 cells because there won't be 10000 cells display at one time in our table view
        
        cell.update(with: board)
        

        // Save Boards values in a Board
        // For BoardTableViewCell formatting
        let layoutNumber = board.layoutNumber
        let boardName = board.boardName
        if let image1FileNameUnwrapped = board.image1FileName, let image2FileNameUnwrapped = board.image2FileName, let image3FileNameUnwrapped = board.image3FileName, let image4FileNameUnwrapped = board.image4FileName {
            let boardObject = Board(layoutNumber: layoutNumber, boardName: boardName, image1FileName: image1FileNameUnwrapped, image2FileName: image2FileNameUnwrapped, image3FileName: image3FileNameUnwrapped, image4FileName: image4FileNameUnwrapped)
            cell.update(with: boardObject)
        }

        cell.showsReorderControl = true

        
        return cell
    }
    
    
    // Edit mode (rearrange and delete) (navigation bar)????

    // Add a new board (navigation bar)
    @IBAction func unwindToInitialVC(segue: UIStoryboardSegue) {
        if let identifier = segue.identifier {
            if identifier == "saveUnwind" {
                print("saveUnwind")
                if let addBoard =
                    segue.source as? Layout1ViewController {
                    if let board = addBoard.boardOptional {
                        print("back in boardTableVC")
                        print(board)
                        boards.append(board)
                        saveBoards()
                    }
                    tableView.reloadData()
                }
            }
        }
        
    }

    
    // MARK: - Segues
    
    /**
     Perform a segue to either the detail or layout choosing page, sending information with it
     
     parameters - segue: the segue being performed
               sender: may or may not be triggered
    */
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let identifier = segue.identifier {
            if identifier == "DetailSegue" {
                // TODO: Implement (and switch it from PA6/7 to this project :) )
                /*if let tripDetailVC = segue.destination as? TripDetailViewController {
                    // Get the indexPath for the row the user clicked on
                    // Get the trip at that row
                    // Pass the trip into detailDetailVC
                    if let indexPath = tableView.indexPathForSelectedRow {
                        let trip = trips[indexPath.row]
                        tripDetailVC.tripOptional = trip
                        tripDetailVC.tripNumber = indexPath[1] + 1
                        tripDetailVC.totalNumTrips = trips.count
                    }
                }*/
            }
            else if identifier == "AddSegue" {
                if let chooseBoardLayoutVC = segue.destination as? ChooseBoardLayoutViewController {
                    if let indexPath = tableView.indexPathForSelectedRow {
                        tableView.deselectRow(at: indexPath, animated: true)
                    }
                }
            }
        }
    }
    
    /**
     Segue back to the main screen when the save button is pressed on the add screen
     Add the new trip to the data source
     
     parameters - segue: the segue being performed
    */
    // Found in the file with this same name on the main branch
   /* @IBAction func unwindToTripTableViewController(segue: UIStoryboardSegue) {
        if let identifier = segue.identifier {
            if identifier == "saveUnwind" {
                print("saveUnwind")
                if let addBoard =
                    segue.source as? Layout1ViewController {
                    if let board = addBoard.boardOptional {
                        print("back in boardTableVC")
                        print(board)
                        boards.append(board)
                        saveBoards()
                    }
                    tableView.reloadData()
                }
            }
        }
    }*/
}
