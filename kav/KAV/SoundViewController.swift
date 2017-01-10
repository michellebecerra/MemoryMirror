//
//  SoundViewController.swift
//  KAV
//
//  Created by Michelle Becerra on 3/1/16.
//  Copyright (c) 2016 Michelle Becerra. All rights reserved.
//

import UIKit
import AVFoundation




class SoundViewController: UIViewController {
    
    // Mark - App Delegate
    
    let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
    
    // MARK: Data
    
    let allWords = "acona yeja raid gawty stoths egog jiepta ikojy zett ovutu vekarr atsi unovey awedo vayka dejixi iptot nespa etyu yesoyz huvi rono vofy jicu woff tiap vubeyt laypt woafu bundy akoav cadol hoto becefy gotye ibir koneco oacabr rudy byda shupab tejyi tiaja navexi boapi yoby rapo oksga ukip epafta medor avauva racs imgoft shed omitu mood molap hild deydid rundy tepow rifa dyzi riviv rojuc binn tifeky aday nelu fabo odirom bapat jucoo oshufi horc chagso shemeb lidduj wygs eawir buverk yaymi ameu kutsri wafsa dydsy dovy quan nulk pico nitu shut vepo tiji rufid hidd aroct koovol ejijee".componentsSeparatedByString(" ")
    //MARK: Properties
    
    @IBOutlet weak var textLabel: UILabel!
    
    @IBOutlet weak var sound: UIImageView!
    
    @IBOutlet weak var playButton: UIButton!
    
    @IBOutlet weak var directions: UILabel!
    
    //MARK: Global Variables
    
    @IBAction func playButtonAct(sender: UIButton) {
        
        let synthesizer = AVSpeechSynthesizer()
        let utterance = AVSpeechUtterance(string: self.string)
        utterance.rate = 0.4
        
        //change the voice like this
        //utterance.voice = AVSpeechSynthesisVoice(language: "fr-FR")
        
        synthesizer.speakUtterance(utterance)

        
    }
    var string:String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        //Random Generator logic
//        let randomIndex = Int(arc4random_uniform(UInt32(allWords.count)))
//        //string = allWords[randomIndex]
//        textLabel.text = allWords[randomIndex]
//        self.string = allWords[randomIndex]
        
        textLabel.text = appDelegate.word2
        self.string = appDelegate.word2
        
        directions.text = "Directions: Press the sound button as many times as you would like to listen to the word. Once you are done, press done"
        
        //var image1 : UIImage = UIImage(named:"sound.png")!

        //playButton.setImage(image1, forState: //UIControlState.Normal)
        
        

        
        
        //Source: http://stackoverflow.com/questions/22561926/ios-7-text-to-speech-api
        
    }

    @IBAction func nextScreen(sender: AnyObject) {
            
            performSegueWithIdentifier("visual", sender: self)

    }
    
    /*@IBAction func nextScreen(sender: UIButton) {
        
        //performSegueWithIdentifier("game", sender: self)
    }*/
    
}

