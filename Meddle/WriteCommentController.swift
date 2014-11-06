//
//  WriteCommentController.swift
//  Meddle
//
//  Created by Fumitoshi Ogata on 2014/11/06.
//  Copyright (c) 2014年 Fumitoshi Ogata. All rights reserved.
//

import UIKit

class WriteCommentController: UIViewController {
    
    @IBOutlet var backButton: UIButton!
    @IBAction func backButtonPushed(sender: AnyObject) {
        self.dismissViewControllerAnimated(true, completion: nil)
    }    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}