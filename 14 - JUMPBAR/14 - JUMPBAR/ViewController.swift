//
//  ViewController.swift
//  14 - JUMPBAR
//
//  Created by heshaoyi on 4/2/16.
//  Copyright © 2016 heshaoyi. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet var tableView: UITableView!
    @IBOutlet var stackView: UIStackView!
    var movieStore: MovieStore = MovieStore()
    
    override func loadView() {
        super.loadView()
        
        let height = navigationController?.navigationBar.frame.height
        let statusHei = UIApplication.sharedApplication().statusBarFrame.height
        
        let inset = UIEdgeInsets(top: height! + statusHei, left: 0, bottom: 0, right: 0)
        tableView.contentInset = inset
        tableView.scrollIndicatorInsets = inset
        
        tableView.delegate = self
        tableView.dataSource = self
        refreshIndex()
        
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    
    func refreshIndex()  {
        for i in 0 ..< movieStore.movieIndex.count{
            let btn = UIButton(type: .System)
            btn.setTitle(String(movieStore.movieIndex[i]!), forState: .Normal)
            stackView.addArrangedSubview(btn)
            btn.addTarget(self, action: #selector(ViewController.scrollToTab(_:)), forControlEvents: .TouchDown)
        }
    }
    
    func scrollToTab(btn: UIButton)  {
        let title = btn.titleLabel?.text!
        for (_, v) in movieStore.movieIndex.enumerate(){
            if String(v.1) == title! {
                tableView.scrollToRowAtIndexPath(NSIndexPath(forRow: 0 ,inSection : v.0), atScrollPosition: .Top, animated: true)
            }
        }
        
        
    }

    func numberOfSectionsInTableView(tableView: UITableView) -> Int{
        return movieStore.movies.count
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        return movieStore.movies[movieStore.movieIndex[section]!]!.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell{
        let cell = tableView.dequeueReusableCellWithIdentifier("movie", forIndexPath: indexPath);
        let movie = movieStore.movies[movieStore.movieIndex[indexPath.section]!]![indexPath.row]
        cell.textLabel?.text = movie.name
        return cell
    }
    
    func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String?{
        return String(movieStore.movieIndex[section]!)
    }
}

