//
//  Tab2ViewController.swift
//  Meddle
//
//  Created by Fumitoshi Ogata on 2014/11/06.
//  Copyright (c) 2014年 Fumitoshi Ogata. All rights reserved.
//

import UIKit


class Tab2ViewController: UIViewController {
    
    @IBOutlet var collectionView: UICollectionView!
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5
    }    

    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        var cell = collectionView.dequeueReusableCellWithReuseIdentifier("cell_identity", forIndexPath: indexPath) as UICollectionViewCell
        //cell.backgroundColor = UIColor.blackColor()
        //cell.textLabel?.text = "\(indexPath.section):\(indexPath.row)"
        //cell.imageView?.image = UIImage(named: "circle")
        return cell
    }
    
    override func viewDidAppear(animated: Bool) {
        var loginAlert:UIAlertController = UIAlertController(title: "New Identity was created", 
            message: "please change identity from your list", preferredStyle: UIAlertControllerStyle.Alert)
        loginAlert.addAction(UIAlertAction(title: "ok", style: .Default, handler: nil))

        self.presentViewController(loginAlert, animated: true, completion: nil)        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

