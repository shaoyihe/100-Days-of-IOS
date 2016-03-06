//
//  SecondViewController.swift
//  PROJECT 07 - PASSING DATA TO ANOTHER VIEW
//
//  Created by heshaoyi on 3/6/16.
//  Copyright © 2016 heshaoyi. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {
    
    @IBOutlet var textView: UITextView!
    
    var text: String!{
        didSet{
            navigationItem.title = "Second View"
        }
    }
    
    override func viewDidAppear(animated: Bool) {
        textView.text = text
        super.viewDidAppear(animated)
    }
    
    
}
