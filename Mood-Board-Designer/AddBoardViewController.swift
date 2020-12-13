//
//  EditLayoutViewController.swift
//  Mood-Board-Designer
//
//  Created by Elizabeth Larson on 12/7/20.

//  Sources:
//      Camera/Photo Alert handling: https://itunes.apple.com/WebObjects/MZStore.woa/wa/viewBook?id=1465002990 (pp. 682-687)
//      writeImage() help: https://cocoacasts.com/fm-2-how-to-store-an-image-in-the-documents-directory-in-swift

import UIKit
//import CoreData

class AddBoardViewController: UIViewController, UITextFieldDelegate, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    //let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    var boardOptional: Board? = nil
    var layoutNumber: Int = 0
    var boardName: String = ""
    var imageLocation1 = ""
    var imageLocation2 = ""
    var imageLocation3 = ""
    var imageLocation4 = ""
    
    // MARK: - Load the View
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // TODO: Pass in layoutNumber (1 or 2)
        layoutNumberLabel.text = "Layout: Layout \(layoutNumber)" // Tell the user what # layout they chose (i.e. Layout: Layout #1)
    }
    
    // MARK: - Layout Number
    @IBOutlet var layoutNumberLabel: UILabel!
    
    // MARK: - Board Name
    @IBOutlet var boardNameTextField: UITextField!
    @IBAction func inputTitle(_ sender: UITextField) {
        guard let inputTitle = boardNameTextField.text, inputTitle != "" else {
            print("Bad input")
            return
        }
        print("Title recieved!")
        boardName = inputTitle
    }
    
    // MARK: - Camera and Photos
    @IBOutlet var photo1ImageView: UIImageView!
    @IBOutlet var photo2ImageView: UIImageView!
    @IBOutlet var photo3ImageView: UIImageView!
    @IBOutlet var photo4ImageView: UIImageView!
    
    
    // Photo (camera) buttons
    @IBAction func photo1Button(_ sender: UIButton) {
        let imagePicker = UIImagePickerController()
        imagePicker.delegate = self
        
        // Create an alert that pops up when the user clicks the camera button
        let alertController = UIAlertController(title: "Choose Image Source", message: nil, preferredStyle: .actionSheet)
        
        // Cancel button
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        alertController.addAction(cancelAction)
        
        // Adds an option to take a picture using the camera (if possible)
        if UIImagePickerController.isSourceTypeAvailable(.camera) {
            let cameraAction = UIAlertAction(title: "Camera", style: .default, handler: { action in imagePicker.sourceType = .camera
                self.present(imagePicker, animated: true, completion: nil)
            })
            alertController.addAction(cameraAction)
        }
        
        // Adds an option to grab a picture from the photo library (if possible)
        if UIImagePickerController.isSourceTypeAvailable(.photoLibrary) {
            let photoLibraryAction = UIAlertAction(title: "Photo Library", style: .default, handler: { action in
                imagePicker.sourceType = .photoLibrary
                self.present(imagePicker, animated: true, completion: nil)
            })
            alertController.addAction(photoLibraryAction)
        }
        
        // Present the alert
        present(alertController, animated: true, completion: nil)
    }
    
    @IBAction func photo2Button(_ sender: UIButton) {
        let imagePicker = UIImagePickerController()
        imagePicker.delegate = self
        
        // Create an alert that pops up when the user clicks the camera button
        let alertController = UIAlertController(title: "Choose Image Source", message: nil, preferredStyle: .actionSheet)
        
        // Cancel button
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        alertController.addAction(cancelAction)
        
        // Adds an option to take a picture using the camera (if possible)
        if UIImagePickerController.isSourceTypeAvailable(.camera) {
            let cameraAction = UIAlertAction(title: "Camera", style: .default, handler: { action in imagePicker.sourceType = .camera
                self.present(imagePicker, animated: true, completion: nil)
            })
            alertController.addAction(cameraAction)
        }
        
        // Adds an option to grab a picture from the photo library (if possible)
        if UIImagePickerController.isSourceTypeAvailable(.photoLibrary) {
            let photoLibraryAction = UIAlertAction(title: "Photo Library", style: .default, handler: { action in
                imagePicker.sourceType = .photoLibrary
                self.present(imagePicker, animated: true, completion: nil)
            })
            alertController.addAction(photoLibraryAction)
        }
        
        // Present the alert
        present(alertController, animated: true, completion: nil)
    }
    
    @IBAction func photo3Button(_ sender: UIButton) {
        let imagePicker = UIImagePickerController()
        imagePicker.delegate = self
        
        // Create an alert that pops up when the user clicks the camera button
        let alertController = UIAlertController(title: "Choose Image Source", message: nil, preferredStyle: .actionSheet)
        
        // Cancel button
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        alertController.addAction(cancelAction)
        
        // Adds an option to take a picture using the camera (if possible)
        if UIImagePickerController.isSourceTypeAvailable(.camera) {
            let cameraAction = UIAlertAction(title: "Camera", style: .default, handler: { action in imagePicker.sourceType = .camera
                self.present(imagePicker, animated: true, completion: nil)
            })
            alertController.addAction(cameraAction)
        }
        
        // Adds an option to grab a picture from the photo library (if possible)
        if UIImagePickerController.isSourceTypeAvailable(.photoLibrary) {
            let photoLibraryAction = UIAlertAction(title: "Photo Library", style: .default, handler: { action in
                imagePicker.sourceType = .photoLibrary
                self.present(imagePicker, animated: true, completion: nil)
            })
            alertController.addAction(photoLibraryAction)
        }
        
        // Present the alert
        present(alertController, animated: true, completion: nil)
    }
    
    @IBAction func photoButton4(_ sender: UIButton) {
        let imagePicker = UIImagePickerController()
        imagePicker.delegate = self
        
        // Create an alert that pops up when the user clicks the camera button
        let alertController = UIAlertController(title: "Choose Image Source", message: nil, preferredStyle: .actionSheet)
        
        // Cancel button
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        alertController.addAction(cancelAction)
        
        // Adds an option to take a picture using the camera (if possible)
        if UIImagePickerController.isSourceTypeAvailable(.camera) {
            let cameraAction = UIAlertAction(title: "Camera", style: .default, handler: { action in imagePicker.sourceType = .camera
                self.present(imagePicker, animated: true, completion: nil)
            })
            alertController.addAction(cameraAction)
        }
        
        // Adds an option to grab a picture from the photo library (if possible)
        if UIImagePickerController.isSourceTypeAvailable(.photoLibrary) {
            let photoLibraryAction = UIAlertAction(title: "Photo Library", style: .default, handler: { action in
                imagePicker.sourceType = .photoLibrary
                self.present(imagePicker, animated: true, completion: nil)
            })
            alertController.addAction(photoLibraryAction)
        }
        
        // Present the alert
        present(alertController, animated: true, completion: nil)
    }
    
    /**
     Write the image to the documents directory for future reference
     
     parameters - photoNumber: Which photo is being saved (i.e. photo1, photo2...)
    */
    func writeImage(photoNumber: Int) {
        // Get the Location of the documents directory
        let documents = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0]
        
        // Generate a file name using a UUID
        let imageFileName = "\(UUID().uuidString).jpg"
        
        // Set URL for the image
        let imageFileURL = documents.appendingPathComponent(imageFileName)
        
        // Get a Data instance using the image
        if let photo = photo1ImageView.image, let data = photo.jpegData(compressionQuality: 1.0) {
            do {
                try data.write(to: imageFileURL)
            } catch {
                print("Error writing image data to disk \(error)")
            }
        }
        
        let imageFromDisk = UIImage(contentsOfFile: imageFileURL.path)
        if photoNumber == 1 {
            imageLocation1 = imageFileURL.path
        }
        else if photoNumber == 2 {
            imageLocation2 = imageFileURL.path
        }
        else if photoNumber == 3 {
            imageLocation3 = imageFileURL.path
        }
        else if photoNumber == 4 {
            imageLocation4 = imageFileURL.path
        }
    }
    
    // MARK: - YouTube?
    
    // MARK: - Saving
    // Saving the board
    @IBAction func saveButton(_ sender: UIButton) {
        if let boardName = boardNameTextField.text {
            if boardName == "" { // Invalid board name input
                // TODO: alert them that it's invalid input
            }
            else { // All inputs are valid and we can perform the segue
                // Only save filled-in values (i.e. non nil image views)
                if photo1ImageView.image != nil {
                    writeImage(photoNumber: 1)
                }
                if photo2ImageView.image != nil {
                    writeImage(photoNumber: 2)
                }
                if photo3ImageView.image != nil {
                    writeImage(photoNumber: 3)
                }
                if photo4ImageView.image != nil {
                    writeImage(photoNumber: 4)
                }
                boardOptional = Board(layoutNumber: layoutNumber, boardName: boardName, image1FileName: imageLocation1, image2FileName: imageLocation2, image3FileName: imageLocation3, image4FileName: imageLocation4)
                performSegue(withIdentifier: "SaveUnwindSegue", sender: self)
            }
        }
        else { // There was an issue beyond improper board name
            // TODO: alert them that it's invalid input
        }
    }
    
    // MARK: - Segues
    // Copied from main branch's unwinding + core data
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let identifier = segue.identifier {
            if identifier == "saveUnwind" {
                /*let newBoard = Board(context: self.context)
                newBoard.title = boardName
                myImageName = writeImage()
                newTrip.imageFileName = myImageName
                boardOptional = newBoard
                print("in layout one")*/
            }
        }
    }
    
    // MARK: - Keyboard Actions
    
    /**
     Dismiss the keyboard when the background/white space is tapped
     
     parameters - sender: the action occuring (in this case, tapping the screen background
    */
    @IBAction func backgroundTapped(_ sender: UITapGestureRecognizer) {
        boardNameTextField.resignFirstResponder()
    }
    
    /**
     Executed when the user presses the return key
     
     parameters - textField: text field to dismiss the keyboard on
     returns - if the text field should return or not
    */
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}
