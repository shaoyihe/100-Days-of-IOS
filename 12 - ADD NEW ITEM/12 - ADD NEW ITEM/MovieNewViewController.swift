//
//  MovieNewViewController.swift
//  12 - ADD NEW ITEM
//
//  Created by heshaoyi on 3/9/16.
//  Copyright © 2016 heshaoyi. All rights reserved.
//

import UIKit

class MovieNewViewController: UIViewController,UITextFieldDelegate {
    
    @IBOutlet var movieField: UITextField!
    
    var movieNew: Movie!
    
    override func viewWillAppear(animated: Bool) {
        movieField.delegate = self
        super.viewWillAppear(animated)
        movieField.becomeFirstResponder()
    }
    
    override func viewWillDisappear(animated: Bool) {
        super.viewWillDisappear(animated)
        movieNew.name = movieField.text!
    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool{
        navigationController?.popViewControllerAnimated(true)
        return false;
    }
}
