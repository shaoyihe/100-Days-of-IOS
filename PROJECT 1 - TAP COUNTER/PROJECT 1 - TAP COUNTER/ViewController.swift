//
//  ViewController.swift
//  PROJECT 1 - TAP COUNTER
//
//  Created by heshaoyi on 2/29/16.
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

}

