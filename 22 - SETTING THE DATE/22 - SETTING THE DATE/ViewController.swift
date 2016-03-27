//
//  ViewController.swift
//  22 - SETTING THE DATE
//
//  Created by heshaoyi on 3/27/16.
//  Copyright © 2016 heshaoyi. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var datePicker: UIDatePicker!
   
    lazy var dateFormat: NSDateFormatter = {
        var df = NSDateFormatter()
        df.dateFormat = "MMM d, YYYY"
        return df
    }()
    
    @IBAction func setDate(sender: UIButton) {
        titleLabel.text = dateFormat.stringFromDate(datePicker.date)
    }
    

}

