//
//  SearchResultsController.swift
//  27 - SEARCH BAR IN TABLE VIEW
//
//  Created by heshaoyi on 4/2/16.
//  Copyright © 2016 heshaoyi. All rights reserved.
//

import UIKit

class SearchResultsController: UITableViewController {
    
    var filters = [Movie]()
    
    func searchMovieStore(movieStore: MovieStore, name: String){
        filters = movieStore.movies.filter({$0.name.lowercaseString.containsString(name.lowercaseString)})
        tableView.reloadData()
    }
    
   override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell{
        let cell = tableView.dequeueReusableCellWithIdentifier("movieResult")
        let movie = filters[indexPath.row]
        cell?.textLabel?.text = movie.name
        return cell!
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        return filters.count
    }
}
