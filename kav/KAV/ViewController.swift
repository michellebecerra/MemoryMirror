//
//  ViewController.swift
//  KAV
//
//  Created by Michelle Becerra on 2/22/16.
//  Copyright (c) 2016 Michelle Becerra. All rights reserved.
//  http://rebeloper.com/read-write-plist-file-swift/
//

import UIKit
import AVFoundation

extension String {
    var length: Int {
        return (self as NSString).length
    }
}

class ViewController: UIViewController, UITextFieldDelegate {
    
    // Mark - App Delegate
    
    let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
    
    // MARK: Data
    
    let allWords = "acona yeja raid gawty stoths egog jiepta ikojy zett ovutu vekarr atsi unovey awedo vayka dejixi iptot nespa etyu yesoyz huvi rono vofy jicu woff tiap vubeyt laypt woafu bundy akoav cadol hoto becefy gotye ibir koneco oacabr rudy byda shupab tejyi tiaja navexi boapi yoby rapo oksga ukip epafta medor avauva racs imgoft shed omitu mood molap hild deydid rundy tepow rifa dyzi riviv rojuc binn tifeky aday nelu fabo odirom bapat jucoo oshufi horc chagso shemeb lidduj wygs eawir buverk yaymi ameu kutsri wafsa dydsy dovy quan nulk pico nitu shut vepo tiji rufid hidd aroct koovol ejijee".componentsSeparatedByString(" ")
    
    // MARK: Properties

    @IBOutlet weak var wordTextField: UITextField!
    
    @IBOutlet weak var directionsOrWord: UILabel!
    
    @IBOutlet weak var directions: UILabel!
    
    

    // MARK: Global Variables
    
    let att = [NSFontAttributeName : UIFont.boldSystemFontOfSize(24)] //Bolding Attribute
    
    var curPos = 0
    
    var string:String = ""

    override func viewDidLoad() {
        super.viewDidLoad()
        
        //self.directionsOrWord.text = "oexra"
        
        //Random Generator logic
//        let randomIndex = Int(arc4random_uniform(UInt32(allWords.count)))
//        string = allWords[randomIndex]
//        
//        directionsOrWord.text = string
//        self.string = allWords[randomIndex]
        
        self.directionsOrWord.text = appDelegate.word1
        self.string = appDelegate.word1
        
        //sets view controller as the delagate for wordTextField
        //This way a delagate can do something when user types word
        self.wordTextField.delegate = self
        directions.text = "Directions: Type out the word you see above the input box. Once you are done, click the done button to move to the next module."

        
        //Source: http://stackoverflow.com/questions/22561926/ios-7-text-to-speech-api
        
        
        
    }
    
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        self.view.endEditing(true)
        return false
    }
    
    
    func textFieldDidEndEditing(textField: UITextField) {

        
        directionsOrWord.text = wordTextField.text
    }
    

    
    // MARK: Actions


    
    func textField(textField: UITextField,
        shouldChangeCharactersInRange range: NSRange,
        replacementString typedLetter: String)
        -> Bool
    {
        
      
        if (self.curPos >= self.string.length) {
            print("DONE!")
            return false
        }
        //Allow only typed letters that match string and bold it
        else if typedLetter.characters.last == self.string[self.string.startIndex.advancedBy(curPos)]
        {
            
            //current position + 1 index to substring it
    
            let index = self.string.startIndex.advancedBy(curPos + 1)
            
            //Substring of the original string up to index so that we can bold this part
            let toBold = self.string.substringToIndex(index)
            
            //Creates a bolded String of the toBold subtring
            let bolded = NSMutableAttributedString(string:toBold, attributes:att)
            
            //Substrings the rest of the letters of the string that are not bolded
            
            let post = NSMutableAttributedString(string: self.string.substringFromIndex(self.string.startIndex.advancedBy(curPos + 1)))            
            //Append the remaining of the word to the end of the bolded part
            bolded.appendAttributedString(post)
            
            //Set label text to be this newly created partially bolded string
            directionsOrWord.attributedText = bolded

            
            curPos += 1
            
            return true
        }
        
        return false
    }
    
    @IBAction func nextScreen(sender: UIButton) {
        
        if self.curPos >= self.string.length {
            
            performSegueWithIdentifier("sound", sender: self)
        }
            
        else {
            let alert = UIAlertController(title: "Alert!", message: "Please finish typing out the entire word.", preferredStyle: UIAlertControllerStyle.Alert)
            alert.addAction(UIAlertAction(title: "Done", style: UIAlertActionStyle.Default, handler: nil))
            self.presentViewController(alert, animated: true, completion: nil)
        }
        
    }
    
    override func didReceiveMemoryWarning() {
        
        super.didReceiveMemoryWarning()

    }
    


}

