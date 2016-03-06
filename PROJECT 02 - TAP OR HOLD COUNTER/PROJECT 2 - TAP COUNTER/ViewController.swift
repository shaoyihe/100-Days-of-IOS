//
//  ViewController.swift
//  PROJECT 2 - TAP COUNTER
//
//  Created by heshaoyi on 3/2/16.
//  Copyright © 2016 heshaoyi. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var counterLabel: UILabel!
    @IBOutlet var resetButton: UIButton!
    @IBOutlet var tapButton: UIButton!
    
    @IBAction func reset(){
        counterLabel.text = "0"
    }
    
    @IBAction func tap(){
        counterLabel.text = String(Int(counterLabel.text!)! + 1)
    }
    
    @IBAction func longPress(){
        counterLabel.text = String(Int(counterLabel.text!)! + 1)
    }

}

