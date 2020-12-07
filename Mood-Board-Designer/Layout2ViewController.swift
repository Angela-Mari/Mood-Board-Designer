//
//  Layout2ViewController.swift
//  Mood-Board-Designer
//
//  Created by Elizabeth Larson on 12/3/20.
//
//  Sources
//  YouTube Player: https://www.youtube.com/watch?v=bsM1qdGAVbU
//  Only Getting a Portion of the Video URL: https://stackoverflow.com/questions/34073610/swift-how-to-get-everything-after-a-certain-set-of-characters

// MARK: - A Note on the Commented-Out Code
//      CocoaPod was installed, but import line reads "No such module 'youtube_ios_player_helper'", despite it being in the Podfile.
//      This messes up some other functionality. I tried this on another project and everything worked fine.
//      These lines have a header above them that reads ------------- YouTube Functionality: Uncomment Below -------------

// ------------- YouTube Functionality: Uncomment Below -------------
// import youtube_ios_player_helper
import UIKit

// ------------- YouTube Functionality: Uncomment Below -------------
// class Layout2ViewController: UIViewController, YTPlayerViewDelegate {
class Layout2ViewController: UIViewController {
    // ------------- YouTube Functionality: Uncomment Below -------------
    //@IBOutlet var videoPreview: YTPlayerView!
    @IBOutlet var urlTextField: UITextField!
    @IBAction func viewInPlayerButton(_ sender: UIButton) {
        if let fullUrl = urlTextField.text {
            if let range = fullUrl.range(of: "=") {
                // videoID is the stuff after the = sign in a YouTube link
                let videoID = fullUrl[range.upperBound...]
                // ------------- YouTube Functionality: Uncomment (2) Below -------------
                //videoPreview.delegate = self
                //videoPreview.load(withVideoId: "" + videoID, playerVars: ["playsinline": 1])
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}
