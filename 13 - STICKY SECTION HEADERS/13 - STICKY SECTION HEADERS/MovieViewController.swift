//
//  MovieViewController.swift
//  13 - STICKY SECTION HEADERS
//
//  Created by heshaoyi on 3/9/16.
//  Copyright © 2016 heshaoyi. All rights reserved.
//

import UIKit

class MovieViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var movieStore: MovieStore! = MovieStore()
    
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int{
        return movieStore.movieIndex.count
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        return movieStore.moviesDic[movieStore.movieIndex[section]!]!.count
    }
    
    func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String?{
        return movieStore.movieIndex[section]
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell{
        let cell = UITableViewCell(style: .Value1, reuseIdentifier: "movies")
        cell.accessoryType = .DisclosureIndicator
        let movie = movieStore.moviesDic[movieStore.movieIndex[indexPath.section]!]![indexPath.item]
        cell.textLabel?.text = movie.name
        return cell
    }
    
}
