//
//  Layout1ViewController.swift
//  Mood-Board-Designer
//
//  Created by Elizabeth Larson on 12/3/20.
//

import UIKit
import CoreData

class Layout1ViewController: UIViewController, UITextFieldDelegate, UINavigationControllerDelegate {
    
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    @IBOutlet var nameTextField: UITextField!
    var myTitle: String = ""
   
    var boardOptional : Board? = nil
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func inputTitle(_ destinationName : UITextField){
        guard let inputTitle = nameTextField.text, inputTitle != "" else {
            print("bad input")
            return
        }
        print("title recieved")
        myTitle = inputTitle
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {// called when 'return' key pressed.
        textField.resignFirstResponder()
        return true
    }
    
    @IBAction func dismissKeyboard(_ sender: UITapGestureRecognizer) {
        view.endEditing(true)
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    */
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if let identifier = segue.identifier {
            if identifier == "saveUnwind" {
                let newBoard = Board(context: self.context)
                newBoard.title = myTitle
//                newTrip.startDate = myStartDate
//                newTrip.endDate = myEndDate
//                myImageName = writeImage()
//                newTrip.imageFileName = myImageName
                boardOptional = newBoard
                print("in layout one")
                //print(boardOptional)
            }
        }
    }
}
