//
//  DetailDetailView.swift
//  Japanese4Kids
//
//  Created by Le Ha Thanh on 7/27/16.
//  Copyright © 2016 le ha thanh. All rights reserved.
//

import UIKit
import AVFoundation

class DetailDetailView: UIViewController {
    var img : UIImage!
    var text : String?
    @IBOutlet weak var imgView: UIImageView!
    
    @IBOutlet weak var speakButton: UIButton!
    @IBOutlet weak var wordTextField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        imgView.image = img
        wordTextField.text = text
        
        speakButton.layer.cornerRadius = speakButton.bounds.width / 2
    }
    
    @IBAction func speakAction(sender: AnyObject) {
        let utterance = AVSpeechUtterance(string: text!)
        utterance.voice = AVSpeechSynthesisVoice(language: "ja-JP")
        
        utterance.rate = 0.25
//        utterance.pitchMultiplier = 0.25
        
        let synthesizer = AVSpeechSynthesizer()
        synthesizer.speakUtterance(utterance)
        
    }
}
