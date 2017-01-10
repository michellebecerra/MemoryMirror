//
//  GameViewController.swift
//  KAV
//
//  Created by Michelle Becerra on 4/19/16.
//  Copyright © 2016 Michelle Becerra. All rights reserved.
//

import Foundation
import UIKit

var cue = ""
var list = [String]()

extension Array {
    var shuffle:[Element] {
        var elements = self
        for index in 0..<elements.count {
            let newIndex = Int(arc4random_uniform(UInt32(elements.count-index)))+index
            if index != newIndex {
                swap(&elements[index], &elements[newIndex])
            }
        }
        return elements
    }
}

class GameViewController: UIViewController, UICollectionViewDelegateFlowLayout, UICollectionViewDataSource {
    
    // Mark - App Delegate
    
    @IBOutlet weak var doneLabel: UILabel!
    
    let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
    
    var listOfWords = [String]()
    
    var gameScore = 0;
    var maxClicks = 0;
    
    
    @IBOutlet var collectionView: UICollectionView?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: 80, left: 10, bottom: 10, right: 10)
        layout.itemSize = CGSize(width: 90, height: 90)
        collectionView = UICollectionView(frame: self.view.frame, collectionViewLayout: layout)
        collectionView!.dataSource = self
        collectionView!.delegate = self
        collectionView!.registerClass(CollectionViewCell.self, forCellWithReuseIdentifier: "CollectionViewCell")
        collectionView!.backgroundColor = UIColor.whiteColor()
        doneLabel.text = "GAME SCORE: "
        
        var label = UILabel(frame: CGRectMake(229, 600, 63, 35))
        label.center = CGPointMake(160, 499)
        label.textAlignment = NSTextAlignment.Center
        label.text = "I'am a test label"
        
        self.view.addSubview(collectionView!)
        
        self.view.addSubview(doneLabel)
        //self.view.addSubview(label)
        
        //create another array and input it in there
        
        // make perfumations and data structure
        
        let w1 = appDelegate.word1
        let w2 = appDelegate.word2
        let w3 = appDelegate.word3
        

        
        //Permutations
        
        //Word 1
        let wordArr = [Character](w1.characters)
        var shuffledArr = wordArr.shuffle
        
        var permutedS1 = ""
        
        for i in 0..<shuffledArr.count{
            permutedS1.append(shuffledArr[i])
        }
        
        var shuffledArr1_1 = wordArr.shuffle
        
        var permutedS1_1 = ""
        
        for i in 0..<shuffledArr1_1.count{
            permutedS1_1.append(shuffledArr1_1[i])
        }
        
        //Word 2
        let wordArr2 = [Character](w2.characters)
        var shuffledArr2 = wordArr2.shuffle
        
        var permutedS2 = ""
        
        for i in 0..<shuffledArr2.count{
            permutedS2.append(shuffledArr2[i])
        }

        var shuffledArr2_1 = wordArr2.shuffle
        
        var permutedS2_1 = ""
        
        for i in 0..<shuffledArr2_1.count{
            permutedS2_1.append(shuffledArr2_1[i])
        }
        
        //Word 3
        let wordArr3 = [Character](w3.characters)
        var shuffledArr3 = wordArr3.shuffle
        
        var permutedS3 = ""
        
        for i in 0..<shuffledArr3.count{
            permutedS3.append(shuffledArr3[i])
        }
        
        var shuffledArr3_1 = wordArr3.shuffle
        
        var permutedS3_1 = ""
        
        for i in 0..<shuffledArr3_1.count{
            permutedS3_1.append(shuffledArr3_1[i])
        }
        
        //Int(arc4random_uniform(UInt32(9)))
        
        listOfWords.append(permutedS1_1)
        listOfWords.append(appDelegate.word3)
        
        //permuatinos and add them

        listOfWords.append(permutedS2_1)
        listOfWords.append(permutedS2)
        listOfWords.append(appDelegate.word2)
        
        
        
        
        listOfWords.append(permutedS1)
        listOfWords.append(permutedS3_1)
        listOfWords.append(permutedS3)
        listOfWords.append(appDelegate.word1)
        
        
        
    }

    
    func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 9
    }
    
    func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
        
        
        //casting to CollectionViewCell
        let cell = collectionView.cellForItemAtIndexPath(indexPath) as! CollectionViewCell
        var rememberedString = "You remebered a:";
        
        while(maxClicks < 3){
            if(cell.textLabel.text == appDelegate.word1)
            {
                
                cell.backgroundColor = UIColor.darkGrayColor()
                gameScore = gameScore + 1;
                cue = "\(cue) kinesthetic word"
                //cue += "You remembered a kinesthetic word ";
                print(cue)
            }
            else if(cell.textLabel.text == appDelegate.word2)
            {
                cell.backgroundColor = UIColor.darkGrayColor()
                gameScore = gameScore + 1;
                cue =  "\(cue) auditory word";
                print(cue)

            }
            else if(cell.textLabel.text == appDelegate.word3)
            {
                cell.backgroundColor = UIColor.darkGrayColor()
                gameScore = gameScore + 1;
                cue = "\(cue) visual word";
                print(cue)

            }
            else{
                cell.backgroundColor = UIColor.darkGrayColor()
                
                //print(maxClicks)
            }
            
            maxClicks = maxClicks + 1;
            break;
            
            //print(gameScore);
        }
        print("DONE \(maxClicks)")
        
        if(maxClicks >= 3){
            doneLabel.text = "GAME SCORE: \(gameScore) \(rememberedString) \(cue)";
            self.view.addSubview(doneLabel)
            print(doneLabel.text)
            print(cue)
        }
        
        
        
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier("CollectionViewCell", forIndexPath: indexPath) as! CollectionViewCell
        
        
        //listOfWords = listOfWords.shuffle
        
        cell.textLabel?.text = self.listOfWords[indexPath.row + indexPath.section]
        //"\(indexPath.section):\(indexPath.row)"
        cell.imageView?.image = UIImage(named: "circle")
        cell.backgroundColor = UIColor.cyanColor()
    
        
        return cell
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}
