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
        
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        let statusBarHeight = UIApplication.sharedApplication().statusBarFrame.height
//        var newFrame = navBar.frame;
//        newFrame.size  = CGSizeMake(newFrame.width, newFrame.height + statusBarHeight + 20)
//        navBar.frame = newFrame
//        navBar.backgroundColor = UIColor.greenColor()
        
        navBar.bottomAnchor.constraintEqualToAnchor(view.topAnchor, constant: statusBarHeight + navBar.frame.height).active = true
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

