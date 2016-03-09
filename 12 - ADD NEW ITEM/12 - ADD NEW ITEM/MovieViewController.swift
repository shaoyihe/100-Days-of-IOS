//
//  MovieViewController.swift
//  12 - ADD NEW ITEM
//
//  Created by heshaoyi on 3/9/16.
//  Copyright © 2016 heshaoyi. All rights reserved.
//

import UIKit

class MovieViewController: UITableViewController {
    var movieStore: MovieStore! = MovieStore()
    var movieNew : Movie?
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        print("viewWillAppear")
        if let name = movieNew?.name where !name.isEmpty{
            movieStore.movies.append(movieNew!)
            movieNew = nil
            tableView.reloadData()
        }
    }
    
    override func viewDidAppear(animated: Bool) {
        
        super.viewDidAppear(animated)
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
       return movieStore.movies.count
    }
    
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell{
        let cell = UITableViewCell(style: .Value1, reuseIdentifier: nil)
        let movie = movieStore.movies[indexPath.item]
        cell.textLabel?.text = movie.name
        cell.accessoryType = .DisclosureIndicator
        return cell
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "newMovie"{
             let movieNewViewController = segue.destinationViewController as! MovieNewViewController
             movieNew = Movie()
             movieNewViewController.movieNew = movieNew
        }
    }
    
    
}
