//
//  VisualViewController.swift
//  KAV
//
//  Created by Aarathi Raghuraman on 3/16/16.
//  Copyright © 2016 KAV. All rights reserved.
//

import UIKit

class VisualViewController: UIViewController {
    
    
    // MARK: Outlets
    
    @IBOutlet weak var label_Gzusi: UILabel!
    
    @IBOutlet var view_Gzusi: UIView!
    // Random words list and index list
    
    let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
    
    // MARK: Data
    
    let allWords = "acona yeja raid gawty stoths egog jiepta ikojy zett ovutu vekarr atsi unovey awedo vayka dejixi iptot nespa etyu yesoyz huvi rono vofy jicu woff tiap vubeyt laypt woafu bundy akoav cadol hoto becefy gotye ibir koneco oacabr rudy byda shupab tejyi tiaja navexi boapi yoby rapo oksga ukip epafta medor avauva racs imgoft shed omitu mood molap hild deydid rundy tepow rifa dyzi riviv rojuc binn tifeky aday nelu fabo odirom bapat jucoo oshufi horc chagso shemeb lidduj wygs eawir buverk yaymi ameu kutsri wafsa dydsy dovy quan nulk pico nitu shut vepo tiji rufid hidd aroct koovol ejijee".componentsSeparatedByString(" ")
    
    var count:Int = 0
    var time:Double = 0.5
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        callTimer()
        //NSTimer.scheduledTimerWithTimeInterval(0.4, target:self, selector:selectorlalalala),userInfo:nil, repeats:true)
        //lalalala();
        
    }
    
    func callTimer()
    {
        var timer = NSTimer()
        timer = NSTimer.scheduledTimerWithTimeInterval(time, target: self, selector: "lalalala", userInfo: nil, repeats: false)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: Actions
    
    /*func textField(textField: UITextField, shouldChangeCharactersInRange range: NSRange*/
    /*   @IBAction func button_gzusi(sender: UIButton) {
     
     
     
     
     //test if coordinate is changing every time func is called
     //println(self.label_Gzusi.center.y) }
     }*/
    
    
    func lalalala(){
        self.label_Gzusi.text = appDelegate.word3
        let viewWidth = self.view_Gzusi.bounds.width
        let viewHeight = self.view_Gzusi.bounds.height
        //let viewWidth = self.view_Gzusi.frame.maxX
        //let viewHeight = self.view_Gzusi.frame.maxY
        
        // Find the labels width and height
        let labelWidth = self.label_Gzusi.frame.width
        let labelHeight = self.label_Gzusi.frame.height
        
        // Find the width and height of the enclosing view
        //let labelViewWidth = self.label_Gzusi.superview!.bounds.width
        //let labelViewHeight = self.label_Gzusi.superview!.bounds.height
        
        // Compute width and height of the area to contain the labels center
        //let labelXwidth = labelViewWidth - viewWidth
        //let labelYheight = labelViewHeight - viewHeight
        
        // Generate a random x and y offset
        let viewXOffset = CGFloat(arc4random_uniform(UInt32(viewWidth-labelWidth)))
        let viewYOffset = CGFloat(arc4random_uniform(UInt32(viewHeight-labelHeight)))
        
        // Offset the labels center by the random offsets.
        self.label_Gzusi.center.x = viewXOffset + labelWidth / 2
        self.label_Gzusi.center.y = viewYOffset + labelHeight / 2
        
        if(self.label_Gzusi.center.x < viewWidth/2)
        {
            self.label_Gzusi.textColor = UIColor(red:CGFloat(drand48()/2), green:CGFloat(drand48()/2), blue:CGFloat(drand48()/2), alpha:1);
        }
        else if(self.label_Gzusi.center.x > viewWidth/2)
        {
            self.label_Gzusi.textColor = UIColor(red:0.5+CGFloat(drand48()/2), green:0.5+CGFloat(drand48()/2), blue:0.5+CGFloat(drand48()/2), alpha:1);
        }
        count = count+1
        if(count<5)
        {
            time = time*1.5
            self.callTimer()
        }
        if(count == 5)
        {
         performSegueWithIdentifier("game", sender: self)   
        }
    }
}

