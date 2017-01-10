//
//  CollectionViewCell.swift
//  KAV
//
//  Created by Michelle Becerra on 4/19/16.
//  Copyright © 2016 Michelle Becerra. All rights reserved.
//

import Foundation

import UIKit


class CollectionViewCell: UICollectionViewCell {
    
    let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
    
    var textLabel: UILabel!
    var imageView: UIImageView!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        imageView = UIImageView(frame: CGRect(x: 0, y: 16, width: frame.size.width, height: frame.size.height*2/3))
        imageView.contentMode = UIViewContentMode.ScaleAspectFit
        contentView.addSubview(imageView)
        
        let textFrame = CGRect(x: 0, y: 32, width: frame.size.width, height: frame.size.height/3)
        textLabel = UILabel(frame: textFrame)
        textLabel.font = UIFont.systemFontOfSize(UIFont.smallSystemFontSize())
        textLabel.textAlignment = .Center
        contentView.addSubview(textLabel)
        
        
        if( textLabel.text == appDelegate.word1 ){
            print("hello")
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
}