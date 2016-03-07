//
//  ViewController.swift
//  08 - SWIPE TO DISMISS KEYBOARD
//
//  Created by heshaoyi on 3/7/16.
//  Copyright © 2016 heshaoyi. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

 
    @IBOutlet var textView: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        automaticallyAdjustsScrollViewInsets = false
        textView.becomeFirstResponder()
        print(navigationItem.backBarButtonItem?.title)
        navigationController?.navigationBar.topItem?.title = "";
        
    }

    @IBAction func dismissKeyBoard(){
        view.endEditing(true)
    }
    
}

