//
//  AddBoardViewController.swift
//  Mood-Board-Designer
//  This program computes the logic needed to add a new board to the data source (database). Performs input validation for board name.
//  CPSC 315-01, Fall 2020
//  Final Project
//  Sources:
//      Camera/Photo Alert handling: https://itunes.apple.com/WebObjects/MZStore.woa/wa/viewBook?id=1465002990 (pp. 682-687)
//      writeImage() help: https://cocoacasts.com/fm-2-how-to-store-an-image-in-the-documents-directory-in-swift
//      Segment control help: https://www.ioscreator.com/tutorials/segmented-control-ios-tutorial
//
//  Created by Elizabeth Larson on 12/7/20.
//

import UIKit

class AddBoardViewController: UIViewController, UITextFieldDelegate, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    // MARK: - Properites/IBOutlets
    
    var boardOptional: BoardObject? = nil
    var layoutNumber: Int = 1 // Segmented control is already on 1 when the screen loads
    // File URLs to the desired images
    var imageLocation1 = ""
    var imageLocation2 = ""
    var imageBeingSet: Int = 1 // The image being set (default photo #1)
    @IBOutlet var titleTextField: UITextField!
    @IBOutlet var alertLabel: UILabel! // Displays error message for invalid input
    @IBOutlet var imageView1: UIImageView!
    @IBOutlet var imageView2: UIImageView!
    @IBOutlet var layoutSegmentedControl: UISegmentedControl!
    @IBOutlet var layout1ExampleImageView: UIImageView!
    @IBOutlet var layout2ExampleImageView: UIImageView!
    
    // MARK: - Load the View
    
    /**
     Start the program when the view loads
    */
    override func viewDidLoad() {
        super.viewDidLoad()
        alertLabel.text = "" // Clear alertLabel's text so the user can't see it at first
        
        // Display the layout examples
        // TODO: Add image examples of the layouts
        //layout1ExampleImageView.image = UIImage(named: "noImage.png")
        //layout2ExampleImageView.image = UIImage(named: "noImage.png")
    }
    
    // MARK: - Choosing a Layout (Segmented Control)
    /**
     Handles hwen the layout segmented control is switched
     
     parameters - sender: the action occuring (in this case, toggling the segmented control)
    */
    @IBAction func indexChanged(_ sender: Any) {
        switch layoutSegmentedControl.selectedSegmentIndex
        {
            case 0:
                layoutNumber = 1
            case 1:
                layoutNumber = 2
            default:
                break
        }
    }
    
    // MARK: - Keyboard Actions
    
    /**
     Dismiss the keyboard when the background/white space is tapped
     
     parameters - sender: the action occuring (in this case, tapping the screen background)
    */
    @IBAction func backgroundTapped(_ sender: UITapGestureRecognizer) {
        titleTextField.resignFirstResponder()
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
    
    // MARK: - Save and Cancel Button Logic
    
    /**
     Performs a segue to the main table view screen if all input is valid, sending the information with it
     
     parameters - sender: the button being pushed
    */
    @IBAction func saveButtonPushed(_ sender: UIButton) {
        print("saved")
        if let title = titleTextField.text {
            // Adjust error message if they forgot to input a board title
            if title == "" {
                alertLabel.text = "Missing board title"
            }
            else { // All inputs are valid and we can perform the segue
                writeImage(imageView: imageView1, imageNum: 1)
                writeImage(imageView: imageView2, imageNum: 2)
                boardOptional = BoardObject(layoutNumber: layoutNumber, title: title, image1Name: imageLocation1, image2Name: imageLocation2)
                performSegue(withIdentifier: "SaveUnwindSegue", sender: self)
            }
        }
        else { // There was an issue beyond improper board title input
            alertLabel.text = "Invalid board title input"
        }
    }
    
    /**
     Ignore any data entered in the text fields and unwind to BoardTableViewController
     
     parameters - sender: the button being pushed
    */
    @IBAction func cancelButtonPushed(_ sender: UIButton) {
        performSegue(withIdentifier: "CancelUnwindSegue", sender: self)
    }
    
    // MARK: - Segue Action
    
    /**
     Validate user credentials, stopping the automatic segue from happening if they're invalid
     
     parameters - identifier: the name of the segue being performed
               sender: may or may not be triggered
     returns - true if all input is valid, false otherwise
    */
    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
        // For alerts...
        //      Board title will be blank ("") if an invalid/blank input was entered
        guard let title = titleTextField.text, title != "" else {
            return false
        }
        return true
    }
    
    // MARK: - Camera/Photo Action
    
    /**
     For photo #1
     When the camera button is pushed, show an alert dialog that prompts the user to 1) cancel, 2) add a photo from their library, or 3) take a picture (if they're not using a simulator)
     
     parameters - sender: the button that was pushed (the camera one, in this case)
    */
    @IBAction func camera1ButtonPushed(_ sender: UIButton) {
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
        
        // Set imageBeingSet to 1 to show that it's the FIRST photo being saved
        imageBeingSet = 1
    }
    
    /**
     For photo #2
     When the camera button is pushed, show an alert dialog that prompts the user to 1) cancel, 2) add a photo from their library, or 3) take a picture (if they're not using a simulator)
     
     parameters - sender: the button that was pushed (the camera one, in this case)
    */
    @IBAction func camera2ButtonPushed(_ sender: UIButton) {
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
        
        // Set imageBeingSet to 1 to show that it's the SECOND photo being saved
        imageBeingSet = 2
    }
    
    
    /**
     Change the image view on the add page to the chosen image
     
     parameters - picker: chosing an image
               info: information about if the user is done picking an image or not
    */
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        guard let selectedImage = info[.originalImage] as? UIImage else { return }
        
        // Keep track of the image that was chosen and then dismiss the image picking screen
        if imageBeingSet == 1 {
            imageView1.image = selectedImage
        }
        else if imageBeingSet == 2 {
            imageView2.image = selectedImage
        }
        dismiss(animated: true, completion: nil)
    }
    
    /**
     Write the image to the documents directory for future reference
    */
    func writeImage(imageView: UIImageView, imageNum: Int) {
        print("writing image")
        // Get the Location of the documents directory
        let documents = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0]
        
        // Generate a file name using a UUID
        let image1Name = "\(UUID().uuidString).jpg"
        
        // Set URL for the image
        let imageFileURL = documents.appendingPathComponent(image1Name)
        
        // Get a Data instance using the image
        if let photo = imageView.image, let data = photo.jpegData(compressionQuality: 1.0) {
            do {
                try data.write(to: imageFileURL, options: [.atomic])
            } catch {
                print("Error writing image data to disk \(error)")
            }
        }
        
        //let imageFromDisk = UIImage(contentsOfFile: imageFileURL.path)
        if imageNum == 1 {
            imageLocation1 = image1Name
        }
        else if imageNum == 2 {
            imageLocation2 = image1Name
        }
    }
}
