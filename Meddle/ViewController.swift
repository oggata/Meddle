//
//  ViewController.swift
//  Meddle
//
//  Created by Fumitoshi Ogata on 2014/11/06.
//  Copyright (c) 2014年 Fumitoshi Ogata. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var filterButton: UIButton!
    @IBOutlet var writeButton: UIButton!
    @IBAction func writeButtonPushed(sender: AnyObject) {
    } 
    @IBOutlet var tableView: UITableView!
    var feedData:NSArray = NSArray()

    override func viewDidAppear(animated: Bool) {
        self.loadData()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //loadData()
        // Do any additional setup after loading the view, typically from a nib.
        //var image = UIImage(named: "headerLogo.png") as UIImage
        //self.navigationController.navigationBar.setBackgroundImage(image, 
        //    forBarMetrics: .Default)
        self.title = "timeLine"
        //self.view.backgroundColor = UIColor.clearColor()
        //self.navigationController?.navigationBar.setBackgroundImage(UIImage(named: "headerLogo.png"), forBarMetrics: .Default)
        self.navigationController?.navigationBar.tintColor = UIColor.whiteColor()
        //self.navigationController?.navigationBar.backgroundColor = UIColor.blueColor()
        self.navigationController?.navigationBar.barTintColor = UIColor(red: 29.0/255.0, green: 202.0/255.0, blue: 255.0/255.0, alpha: 1)
        
        
        setHeaderIconImage()
        setIconImage()
    }
    
    
    func setHeaderIconImage(){
        self.filterButton.setTitle("", forState: .Normal)
        self.filterButton.setImage(UIImage(named: "Gear.png"), forState: UIControlState.Normal)
        self.filterButton.sizeToFit()
        
        self.writeButton.setTitle("", forState: .Normal)
        self.writeButton.setImage(UIImage(named: "Chat.png"), forState: UIControlState.Normal)
        self.writeButton.sizeToFit()
    }
    
    func setIconImage(){
    
        self.tabBarController?.tabBar.barTintColor = UIColor.blackColor()
        
        var tabbarItem = self.tabBarController?.tabBar.items![0] as UITabBarItem;
        tabbarItem.image = UIImage(named: "Brightness.png")
        //tabbarItem.title = nil
        
        tabbarItem = self.tabBarController?.tabBar.items![1] as UITabBarItem;
        tabbarItem.image = UIImage(named: "Closed-Mail.png")
        //tabbarItem.title = nil
        
        tabbarItem = self.tabBarController?.tabBar.items![2] as UITabBarItem;
        tabbarItem.image = UIImage(named: "Add-to-Cloud.png")
        //tabbarItem.title = nil
        
        tabbarItem = self.tabBarController?.tabBar.items![3] as UITabBarItem;
        tabbarItem.image = UIImage(named: "Radio-Tower.png")
        //tabbarItem.title = nil
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func tableView(tableView: UITableView!, numberOfRowsInSection section: Int) -> Int  {
        //return 10
        return self.feedData.count as Int
    }
    
    func tableView(tableView: UITableView?, cellForRowAtIndexPath indexPath:NSIndexPath!) -> UITableViewCell! {
        //let cell: UITableViewCell = UITableViewCell(style: UITableViewCellStyle.Subtitle, reuseIdentifier: "Cell")
        //cell.textLabel?.text = "xxxx"
        //cell.textLabel?.text = self.damsData[indexPath.row]["name"] as String?
        
        let cell: CommentsViewCell = self.tableView.dequeueReusableCellWithIdentifier("comment_cell_identifier") as CommentsViewCell     
        
        var _comment:String = self.feedData[indexPath.row]["comment"] as String!
        cell.setComment(_comment)
        
        
        
        
        return cell
    }
    
    func tableView(tableView: UITableView?, didSelectRowAtIndexPath indexPath:NSIndexPath!) {
    }
    
    
    // Parseからデータの取得
    func loadData(){
        var query:PFQuery = PFQuery(className: "Feeds")
        //query.whereKey("DamId",equalTo:self.damId)
        query.limit = 999
        //query.orderByAscending("createdAt")
        query.orderByDescending("createdAt")
        query.findObjectsInBackgroundWithBlock{
            (objects:[AnyObject]!, error:NSError!)->Void in
            if error != nil{
                print(error)
            }else{
                self.feedData = objects
                //self.tableView.rowHeight = UITableViewAutomaticDimension
                self.tableView?.reloadData()
            }
        }
    }
    
}


class CommentsViewCell: UITableViewCell {
        
    @IBOutlet var timeLable: UILabel!
    @IBOutlet var nameLabel: UILabel!
    @IBOutlet var commentLable: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        //let colorView = UIView()
        self.backgroundColor = UIColor.yellowColor()
        
        
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
    
    override func sizeThatFits(size: CGSize) -> CGSize {
        var sizeThatFits = self.commentLable!.sizeThatFits(size)
        var width = CGFloat(640)
        if(sizeThatFits.height * 1.7 < 400){
            sizeThatFits.height  = 400 / 1.7
        }
        return CGSizeMake(width, sizeThatFits.height * 1.7);
    }  
    
    func setComment(comment:String){
        commentLable.text = comment
        // 行数無制限
        commentLable.numberOfLines = 0;
        // サイズを自動調整
        commentLable.sizeToFit()
        // 文字を詰めて改行する
        //commentLable.lineBreakMode = NSLineBreakMode.ByCharWrapping
        self.layoutIfNeeded() 
    }
}

