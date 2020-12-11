//
//  Layout2ViewController.swift
//  Mood-Board-Designer
//
//  Created by Elizabeth Larson on 12/3/20.
//
//  Sources
//  YouTube Player: https://www.youtube.com/watch?v=bsM1qdGAVbU
//  Only Getting a Portion of the Video URL: https://stackoverflow.com/questions/34073610/swift-how-to-get-everything-after-a-certain-set-of-characters

// TODO: Move YouTube stuff to add a new board page (as the layouts have been condensed to one screen)

import youtube_ios_player_helper
import UIKit

class Layout2ViewController: UIViewController, YTPlayerViewDelegate {
    @IBOutlet var videoPreview: YTPlayerView!
    @IBOutlet var urlTextField: UITextField!
    @IBAction func viewInPlayerButton(_ sender: UIButton) {
        if let fullUrl = urlTextField.text {
            if let range = fullUrl.range(of: "=") {
                // videoID is the stuff after the = sign in a YouTube link
                let videoID = fullUrl[range.upperBound...]
                videoPreview.delegate = self
                videoPreview.load(withVideoId: "" + videoID, playerVars: ["playsinline": 1])
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}
