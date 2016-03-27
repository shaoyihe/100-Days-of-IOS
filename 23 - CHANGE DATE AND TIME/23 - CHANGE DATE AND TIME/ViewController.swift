//
//  ViewController.swift
//  23 - CHANGE DATE AND TIME
//
//  Created by heshaoyi on 3/27/16.
//  Copyright © 2016 heshaoyi. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var dateLabel: UILabel!
    @IBOutlet var changeView: UIView!
    @IBOutlet var showView: UIView!
    
    @IBOutlet var middleLineView: UIView!
    @IBOutlet var todayLabel: UILabel!
    
    @IBOutlet var datePicker: UIDatePicker!
    @IBOutlet var timePicker: UIDatePicker!
    
    private var choiceDate: NSDate = NSDate()
    
    lazy var dateFormat: NSDateFormatter = {
        var df = NSDateFormatter()
        df.dateFormat = "MMM d, YYYY 'at' HH:mm"
        return df
    }()
    
    lazy var todayDateFormat: NSDateFormatter = {
        var df = NSDateFormatter()
        df.dateStyle = .LongStyle
        return df
    }()
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        dateLabel.text = dateFormat.stringFromDate(choiceDate)
    }
    
    @IBAction func changeDate(sender: UIButton) {
        todayLabel.text = "Today is \(todayDateFormat.stringFromDate(NSDate()))"
        datePicker.date = choiceDate
        timePicker.date = choiceDate
        showView.hidden = true
        changeView.hidden = false
    }
    
    @IBAction func cancelAction(sender: UIButton) {
        back()
    }
    
    @IBAction func doneAction(sender: AnyObject) {
        choiceDate = combine()(date: datePicker.date, time: timePicker.date)
        dateLabel.text = dateFormat.stringFromDate(choiceDate)
        back()
    }
    
    private func back(){
        showView.hidden = false
        changeView.hidden = true
    }
    
    func combine() -> (date: NSDate, time:NSDate) -> NSDate{
        var df = NSDateFormatter()
        df.dateFormat = "YYYY MM dd"
        var tf = NSDateFormatter()
        tf.dateFormat = "HH:mm:ss"
        var dtf = NSDateFormatter()
        dtf.dateFormat = df.dateFormat + tf.dateFormat
        
        func innCombie(date: NSDate, time:NSDate)-> NSDate{
            return dtf.dateFromString(df.stringFromDate(date) + tf.stringFromDate(time) )!
        }
        return innCombie
    }
    
}

