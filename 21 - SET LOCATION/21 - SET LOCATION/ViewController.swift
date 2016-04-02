//
//  ViewController.swift
//  21 - SET LOCATION
//
//  Created by heshaoyi on 4/2/16.
//  Copyright © 2016 heshaoyi. All rights reserved.
//

import UIKit
import CoreLocation

class ViewController: UIViewController, CLLocationManagerDelegate {

    @IBOutlet var locationLabel: UILabel!
    lazy var clm: CLLocationManager = {
        let c = CLLocationManager()
        c.desiredAccuracy = kCLLocationAccuracyBest
        c.delegate = self
        return c;
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    @IBAction func refreshLocacionAction(sender: UIButton) {
        clm.requestWhenInUseAuthorization()
        clm.requestLocation()
    }

    func locationManager(manager: CLLocationManager, didUpdateLocations locations: [CLLocation]){
        let last = locations.last!
        print(last.coordinate.latitude)
    }
    
    func locationManager(manager: CLLocationManager, didFailWithError error: NSError){
        print("get error \(error)")
    }
}

