//
//  ViewController.swift
//  PROJECT 07 - PASSING DATA TO ANOTHER VIEW
//
//  Created by heshaoyi on 3/6/16.
//  Copyright © 2016 heshaoyi. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController {

    @IBOutlet var textView: UITextView!
    
    override func loadView() {
        super.loadView()
        automaticallyAdjustsScrollViewInsets = false
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        textView.becomeFirstResponder()
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "SecondView" {
           let secondVC = segue.destinationViewController as! SecondViewController
           secondVC.text = textView.text
        }
    }
}

