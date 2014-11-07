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
        self.title = "MyIdentities"
    }

    func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 20
    }    

    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> CoViewCell {
        var cell = collectionView.dequeueReusableCellWithReuseIdentifier("cell_identity", forIndexPath: indexPath) as CoViewCell
        //cell.backgroundColor = UIColor.blackColor()
        //cell.textLabel?.text = "\(indexPath.section):\(indexPath.row)"        
        var fileName = "mantou_" + NSString(format:"%03d",indexPath.row + 1) + ".png"
        cell.imageView?.image = UIImage(named:fileName)
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



class CoViewCell: UICollectionViewCell {

    @IBOutlet var imageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        self.imageView?.image = UIImage(named: "mantou_001.png")
        
        let randInt = arc4random_uniform(10);
        if(randInt == 1) {
            self.backgroundColor = UIColor.redColor()
        }else if(randInt == 2){            
            self.backgroundColor = UIColor.blueColor()
        }else if(randInt == 3){
            self.backgroundColor = UIColor.brownColor()
        }else if(randInt == 4){
            self.backgroundColor = UIColor.cyanColor()
        }else if(randInt == 5){
            self.backgroundColor = UIColor.greenColor()
        }else if(randInt == 6){
            self.backgroundColor = UIColor.orangeColor()
        }else if(randInt == 7){
            self.backgroundColor = UIColor.purpleColor()
        }else if(randInt == 8){
            self.backgroundColor = UIColor.grayColor()
        }else{
            self.backgroundColor = UIColor.yellowColor()
        }
    }
    
    /*
    func loadImageAsync(url:NSURL,imageView:UIImageView) {
        var request = NSURLRequest(URL: url)
        NSURLConnection.sendAsynchronousRequest(request, queue: NSOperationQueue.mainQueue()) { 
            (response:NSURLResponse!, data:NSData!, error:NSError!) -> Void in
            let httpResponse: NSHTTPURLResponse = response as NSHTTPURLResponse
            if (httpResponse.statusCode == 200){
                imageView.image = UIImage(data: data)
            }else{
                imageView.image = UIImage(named:"Gear.png")
            }
        }
    }*/

    /*
    func configureCell(inputTitle:String,inputURL:String){
        titleLable.text = inputTitle
        //CommunityImage.image = UIImage(named:"001.png")
        //println("http://49.212.59.155/VirtualSmartPhone/res/Normal/" + inputURL)
        var requestURL = "http://49.212.59.155/VirtualSmartPhone/res/Normal/" + inputURL
        var imageUrl = NSURL(string:requestURL)
        loadImageAsync(imageUrl,imageView:CommunityImage!)
    }*/
}


