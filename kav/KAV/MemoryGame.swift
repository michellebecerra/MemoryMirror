//
//  MemoryGame.swift
//  KAV
//
//  Created by Michelle Becerra on 4/14/16.
//  Copyright (c) 2016 Michelle Becerra. All rights reserved.
//

import Foundation
import UIKit



class MemoryGame: UICollectionView, UICollectionViewDelegateFlowLayout, UICollectionViewDataSource{
    
    @IBOutlet var collectionView: UICollectionView?
    
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    let textLabel: UILabel!
    let imageView: UIImageView!
    
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
    }
    
}
    
    
//    let model: [[UIColor]] = MemoryGame().generateRandomData();
//    
//@IBOutlet private weak var collectionView: UICollectionView!
//
//
//    
//    func setCollectionViewDataSourceDelegate
//        <D: protocol<UICollectionViewDataSource, UICollectionViewDelegate>>
//        (dataSourceDelegate: D, forRow row: Int) {
//            
//            collectionView.delegate = dataSourceDelegate
//            collectionView.dataSource = dataSourceDelegate
//            collectionView.tag = row
//            collectionView.reloadData()
//    }
//
//    
//    
//    override func tableView(tableView: UITableView,
//        numberOfRowsInSection section: Int) -> Int {
//            return model.count
//    }
//    
//    override func tableView(tableView: UITableView,
//        cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
//            
//            let cell = tableView.dequeueReusableCellWithIdentifier("Cell",
//                forIndexPath: indexPath)
//            
//            return cell 
//    }
//    
//    override func tableView(tableView: UITableView,
//        willDisplayCell cell: UITableViewCell,
//        forRowAtIndexPath indexPath: NSIndexPath) {
//            
//            guard let tableViewCell = cell as? TableViewCell else { return }
//            
//            tableViewCell.setCollectionViewDataSourceDelegate(self, forRow: indexPath.row)
//    }
//    
//
//    func generateRandomData() -> [[UIColor]]{
//        return [[UIColor.blueColor()]]
//    }
    
    
    

    

    
    
    

