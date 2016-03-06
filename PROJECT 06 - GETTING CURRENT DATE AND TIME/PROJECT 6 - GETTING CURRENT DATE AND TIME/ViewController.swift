//
//  ViewController.swift
//  PROJECT 6 - GETTING CURRENT DATE AND TIME
//
//  Created by heshaoyi on 3/6/16.
//  Copyright © 2016 heshaoyi. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var refreshDateButton: UIButton!
    @IBOutlet var dateLabel: UILabel!
    
    var dateFormatter:NSDateFormatter{
        let dateFormatter = NSDateFormatter()
        dateFormatter.dateFormat = "YYYY-MM-dd HH:mm:ss"
        return dateFormatter
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        refreshDate()
    }
    
    @IBAction func refreshDate(){
        dateLabel.text = dateFormatter.stringFromDate(NSDate())
    }

}

