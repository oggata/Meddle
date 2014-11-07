//
//  WriteCommentController.swift
//  Meddle
//
//  Created by Fumitoshi Ogata on 2014/11/06.
//  Copyright (c) 2014年 Fumitoshi Ogata. All rights reserved.
//

import UIKit

protocol CommentViewControllerDelegate{
    func reloadCommentTable(writeCommentController:WriteCommentController)
}

class WriteCommentController: UIViewController {
    
    var delegate:CommentViewControllerDelegate? = nil
    
    @IBOutlet var backButton: UIButton!
    @IBAction func backButtonPushed(sender: AnyObject) {        
        self.dismissViewControllerAnimated(true, completion: nil)
    }    
    
    @IBOutlet var writeButton: UIButton!
    @IBAction func writeButtonPushed(sender: AnyObject) {
        writeData()

        //self.delegate?.reloadCommentTable(self)
        self.dismissViewControllerAnimated(true, completion: nil)
    }

    @IBOutlet var inputComment: UITextView!
   
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.title = "Write"
        
        inputComment.frame = CGRectMake(0, 0, 300, 300)
        inputComment.allowsEditingTextAttributes = true
        inputComment.layer.borderWidth = 1
        inputComment.layer.borderColor = UIColor.blackColor().CGColor
        inputComment.layer.cornerRadius = 8
        
        
        
        var vController : ViewController = self.storyboard?.instantiateViewControllerWithIdentifier("STIDViewController") as ViewController
        self.delegate = vController

    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func writeData(){
        var feeds:PFObject=PFObject(className: "Feeds")
        //feeds.setObject(self.damId, forKey: "DamId")
        feeds.setObject(self.inputComment!.text, forKey: "comment")
        feeds.setObject("", forKey: "iconUrl")
        feeds.setObject("", forKey: "tag")
        feeds.setObject(1, forKey: "userId")
        feeds.setObject("", forKey: "userName")
        feeds.setObject(1, forKey: "identityId")
        feeds.setObject("", forKey: "identityName")
        feeds.saveInBackgroundWithBlock {
            (success: Bool!,error: NSError!) -> Void in
            if success==true {
                //print("parse edildi score id = \(score.objectId) ")
                println("success")
                self.delegate?.reloadCommentTable(self)
                //self.delegate?.reloadCommentListTable(self)
            }else{
                print(error)
            }
        }
    }
    
}