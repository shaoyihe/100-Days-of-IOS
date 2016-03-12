//
//  ViewController.swift
//  09 - ADD PHOTO FROM CAMERA ROLL
//
//  Created by heshaoyi on 3/12/16.
//  Copyright © 2016 heshaoyi. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    @IBOutlet var textView: UITextView!
    @IBOutlet var imageView: UIImageView!

    override func loadView() {
        super.loadView()
        automaticallyAdjustsScrollViewInsets = false
        textView.becomeFirstResponder()
        navigationController?.navigationBar.topItem?.title = ""
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .Camera, target: self, action: "takePhoto")
    }
    
    func takePhoto(){
        let camera = UIImagePickerController()
        if UIImagePickerController.isSourceTypeAvailable(.Camera){
            camera.sourceType = .Camera
        }else{
            camera.sourceType = .PhotoLibrary
        }
        camera.delegate = self
        presentViewController(camera, animated: true, completion: nil)
    }
  
    func imagePickerController(picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : AnyObject]){
        let image = info[UIImagePickerControllerOriginalImage] as! UIImage
        imageView.image = image
        dismissViewControllerAnimated(true, completion: nil)
    }
}

