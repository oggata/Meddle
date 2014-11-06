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
    
    
    
    @IBOutlet var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
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
        
        
        setIconImage()

        

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
        return 10
    }
    
    func tableView(tableView: UITableView?, cellForRowAtIndexPath indexPath:NSIndexPath!) -> UITableViewCell! {
        //let cell: UITableViewCell = UITableViewCell(style: UITableViewCellStyle.Subtitle, reuseIdentifier: "Cell")
        //cell.textLabel?.text = "xxxx"
        //cell.textLabel?.text = self.damsData[indexPath.row]["name"] as String?
        
        let cell: CommentsViewCell = self.tableView.dequeueReusableCellWithIdentifier("comment_cell_identifier") as CommentsViewCell     
        //var _comment:String = CommentArray[indexPath.row]["comment"]!
        //cell.setComment(_comment)                
        return cell
    }
    
    func tableView(tableView: UITableView?, didSelectRowAtIndexPath indexPath:NSIndexPath!) {
    }
}


class CommentsViewCell: UITableViewCell {
        
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func setComment(comment:String){

    }
}

