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
        
        
        //self.filterButton.imageView.contentMode = UIViewContentModeScaleAspectFit
        self.filterButton.setTitle("", forState: .Normal)
        self.filterButton.setImage(UIImage(named: "Gear.png"), forState: UIControlState.Normal)
        self.filterButton.sizeToFit()
        
        self.writeButton.setTitle("", forState: .Normal)
        self.writeButton.setImage(UIImage(named: "Chat.png"), forState: UIControlState.Normal)
        self.writeButton.sizeToFit()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    func tableView(tableView: UITableView!, numberOfRowsInSection section: Int) -> Int  {
        return 10
    }
    
    func tableView(tableView: UITableView?, cellForRowAtIndexPath indexPath:NSIndexPath!) -> UITableViewCell! {
        let cell: UITableViewCell = UITableViewCell(style: UITableViewCellStyle.Subtitle, reuseIdentifier: "Cell")
        cell.textLabel?.text = "xxxx"
        //cell.textLabel?.text = self.damsData[indexPath.row]["name"] as String?
        return cell
    }
    
    func tableView(tableView: UITableView?, didSelectRowAtIndexPath indexPath:NSIndexPath!) {
    }
}

