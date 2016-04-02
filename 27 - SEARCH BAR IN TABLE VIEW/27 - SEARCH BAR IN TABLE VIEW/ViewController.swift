//
//  ViewController.swift
//  27 - SEARCH BAR IN TABLE VIEW
//
//  Created by heshaoyi on 4/2/16.
//  Copyright © 2016 heshaoyi. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UISearchResultsUpdating, UITableViewDataSource{

    @IBOutlet var titleView: UIView!
    @IBOutlet var tableView: UITableView!
    var searchController: UISearchController?
    var movieStore = MovieStore.get()
    
    override func loadView() {
        super.loadView()
        let resultsController = self.storyboard?.instantiateViewControllerWithIdentifier("searchResult")
        self.searchController = UISearchController(searchResultsController: resultsController)
        tableView.tableHeaderView = self.searchController?.searchBar
        self.searchController?.searchResultsUpdater = self;
        self.searchController?.dimsBackgroundDuringPresentation = true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    func updateSearchResultsForSearchController(searchController: UISearchController){
        let search = self.searchController?.searchResultsController as! SearchResultsController
        search.searchMovieStore(movieStore, name: searchController.searchBar.text!)
    }
   
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell{
        let cell = tableView.dequeueReusableCellWithIdentifier("movie")
        let movie = movieStore.movies[indexPath.row]
        cell?.textLabel?.text = movie.name
        return cell!
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        return movieStore.movies.count
    }
 
}

