//
//  ViewController.swift
//  19 - BUTTONS ABOVE KEYBOARD
//
//  Created by heshaoyi on 4/4/16.
//  Copyright © 2016 heshaoyi. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var textView: UITextView!
    @IBOutlet var curDate: UILabel!
    
    lazy var df: NSDateFormatter = {
        let dateF = NSDateFormatter()
        dateF.dateFormat = "E d, yyyy"
        return dateF
    }()
    
    override func loadView() {
        super.loadView()
        
        
        let numberToolbar = UIToolbar(frame: CGRectMake(0, 0, self.view.frame.size.width, 50))
        numberToolbar.barStyle = UIBarStyle.Default
        
        numberToolbar.items = [
            UIBarButtonItem(title: "Camera", style: UIBarButtonItemStyle.Plain, target: nil, action: nil),
            UIBarButtonItem(title: "Loc", style: UIBarButtonItemStyle.Plain, target: nil, action: nil)]
        
        numberToolbar.sizeToFit()
        textView.inputAccessoryView = numberToolbar
        
        textView.becomeFirstResponder()
        curDate.text = df.stringFromDate(NSDate())
    }



}

