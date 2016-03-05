//
//  ViewController.swift
//  PROJECT 5 - BASIC TABLE VIEW
//
//  Created by heshaoyi on 3/5/16.
//  Copyright © 2016 heshaoyi. All rights reserved.
//

import UIKit

class MovieViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    var movieStore: MovieStore!
    
    @IBOutlet var navBar: UINavigationBar!
    @IBOutlet var movieTableView: UITableView!
    
    override func loadView() {
        super.loadView()
        movieTableView.delegate = self
        movieTableView.dataSource = self
        
        let statusBarHeight = UIApplication.sharedApplication().statusBarFrame.height
        navBar.topAnchor.constraintEqualToAnchor(view.topAnchor, constant: statusBarHeight + 100 + navBar.frame.height).active = true
        navBar.setNeedsDisplay()
        
    }

    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell{
        let cell = UITableViewCell(style: .Value1, reuseIdentifier: nil)
        cell.accessoryType = .DisclosureIndicator
        
        let movie = movieStore.moives[indexPath.item]
        cell.textLabel?.text = movie.name
        return cell
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        return movieStore.moives.count
    }
    
}

