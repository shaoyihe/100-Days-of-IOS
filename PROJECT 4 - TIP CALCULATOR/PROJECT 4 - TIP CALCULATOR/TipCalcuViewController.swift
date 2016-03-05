//
//  ViewController.swift
//  PROJECT 4 - TIP CALCULATOR
//
//  Created by heshaoyi on 3/5/16.
//  Copyright © 2016 heshaoyi. All rights reserved.
//

import UIKit

class TipCalcuViewController: UIViewController ,UITextFieldDelegate{

    lazy var ns: NSNumberFormatter = {
        var ns = NSNumberFormatter()
        ns.minimumFractionDigits = 2
        ns.maximumFractionDigits = 2
        return ns
    }()
    
    @IBOutlet var doneToolbar: UIToolbar!
    @IBOutlet var titleLabel :UILabel!
    @IBOutlet var originOutcomeField: UITextField!
    @IBOutlet var tipLabel: UILabel!
    @IBOutlet var tipOutcomeLabel: UILabel!
    @IBOutlet var totalOutcomeLabel: UILabel!
    @IBOutlet var tipSlider: UISlider!
    
    override func loadView() {
        super.loadView()
        
        
        //create horizontal line after title , but use IB opposite
//        let titleFrame = titleLabel.frame
//        let horizontalRect = CGRect(x: 0, y: titleFrame.origin.y + titleFrame.height + 8, width: view.frame.width, height: 2)
//        
//        let horLine = UIView(frame: horizontalRect)
//        horLine.backgroundColor = UIColor(red: 227/250, green: 227/250, blue: 227/250, alpha: 0.8)
//        view.addSubview(horLine)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        originOutcomeField.becomeFirstResponder()
        
        let initCurrency = "\(ns.currencySymbol)0.00"
        originOutcomeField.placeholder = initCurrency
        tipOutcomeLabel.text = initCurrency
        totalOutcomeLabel.text = initCurrency
        
        //注册键盘出现事件
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "showKeyBoard:", name:UIKeyboardWillShowNotification, object: nil)
    }
    
    func convertCurrencyToNum(str: String) -> Double?{
        if str.hasPrefix(ns.currencySymbol){
            let startInd = str.startIndex
            return Double(str.substringFromIndex(startInd.advancedBy(ns.currencySymbol.characters.count)))
        }
        return Double(str)
    }
    
    @IBAction func updateOutcomeDone(){
        originOutcomeField.resignFirstResponder()
        doneToolbar.hidden = true
        if let input = convertCurrencyToNum(originOutcomeField.text!){
            let originOutcome = ns.stringFromNumber(input)
            originOutcomeField.text = "\(ns.currencySymbol)\(originOutcome!)"
            notifyChange()
        }
    }
    
    @IBAction func updateTip(tipSlider: UISlider){
        let newValue = Int(round(tipSlider.value))
        tipLabel.text = "Tip(\(newValue)%)"
        print(newValue)
        notifyChange()
    }
    
    
    func notifyChange(){
        if let input = convertCurrencyToNum(originOutcomeField.text!){
            let tipVal:Double = Double(round(tipSlider.value))
            let tipOutcomeVal = ns.stringFromNumber(input * tipVal / 100.0)
            tipOutcomeLabel.text = "\(ns.currencySymbol)\(tipOutcomeVal!)"
            let totalVal = ns.stringFromNumber(input * tipVal / 100.0 + input)
            totalOutcomeLabel.text = "\(ns.currencySymbol)\(totalVal!)"
        }
        
    }
    
    /**
        when show keyboard
    */
    func showKeyBoard(notification: NSNotification){
        if let userInfo = notification.userInfo {
            let keyboardFrame: CGRect = (userInfo[UIKeyboardFrameEndUserInfoKey] as! NSValue).CGRectValue()
            doneToolbar.bottomAnchor.constraintGreaterThanOrEqualToAnchor(view.bottomAnchor, constant: -keyboardFrame.height).active = true
            doneToolbar.hidden = false
            print(keyboardFrame)
        }
    }
    
    func textField(textField: UITextField, shouldChangeCharactersInRange range: NSRange, replacementString string: String) -> Bool {
        switch string{
        case "0"..."9" , "":
            return true
        case ".":
            return !textField.text!.containsString(".")
        default:
            return false
        }
    }
}

