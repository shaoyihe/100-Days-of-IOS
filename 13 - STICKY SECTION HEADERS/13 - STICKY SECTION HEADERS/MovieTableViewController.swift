//
//  MovieViewController.swift
//  13 - STICKY SECTION HEADERS
//
//  Created by heshaoyi on 3/9/16.
//  Copyright © 2016 heshaoyi. All rights reserved.
//

import UIKit

class MovieTableViewController: UITableViewController {
    
    var movieStore: MovieStore! = MovieStore()
    
    override func loadView() {
        super.loadView()
        let statusHeight = UIApplication.sharedApplication().statusBarFrame.height
        let inset = UIEdgeInsets(top: statusHeight, left: 0, bottom: 0, right: 0)
        tableView.contentInset = inset
        tableView.scrollIndicatorInsets = inset
    }
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int{
        return movieStore.movieIndex.count
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        return movieStore.moviesDic[movieStore.movieIndex[section]!]!.count
    }
    
    override func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String?{
        return movieStore.movieIndex[section]
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell{
        let cell = UITableViewCell(style: .Value1, reuseIdentifier: "movies")
        cell.accessoryType = .DisclosureIndicator
        let movie = movieStore.moviesDic[movieStore.movieIndex[indexPath.section]!]![indexPath.item]
        cell.textLabel?.text = movie.name
        return cell
    }
    
}
