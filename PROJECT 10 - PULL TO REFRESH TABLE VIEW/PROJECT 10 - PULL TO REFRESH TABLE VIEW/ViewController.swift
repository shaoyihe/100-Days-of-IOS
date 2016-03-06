//
//  ViewController.swift
//  PROJECT 11 - DELETING AND REARRANGING
//
//  Created by heshaoyi on 3/6/16.
//  Copyright © 2016 heshaoyi. All rights reserved.
//

import UIKit

class ViewController: UITableViewController {

    var itemStore: ItemStore!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let statusBarHeight = UIApplication.sharedApplication().statusBarFrame.height
        let inset = UIEdgeInsets(top: statusBarHeight, left: 0, bottom: 0, right: 0)
        tableView.contentInset = inset
        tableView.scrollIndicatorInsets = inset
        
        let refresh = UIRefreshControl()
        refresh.addTarget(self, action: "refreshData", forControlEvents: .ValueChanged)
        refreshControl = refresh
    }
    
    func refreshData(){
        refreshControl?.beginRefreshing()
        itemStore.fresh()
        tableView.reloadData()
        refreshControl?.endRefreshing()
    }


    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        return itemStore.items.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell{
        let item = itemStore.items[indexPath.item]
        let cell = UITableViewCell(style: .Value1, reuseIdentifier: nil)
        cell.accessoryType = .DisclosureIndicator
        cell.textLabel?.text = item.name
        return cell
    }
    
    
    override func tableView(tableView: UITableView, moveRowAtIndexPath sourceIndexPath: NSIndexPath, toIndexPath destinationIndexPath: NSIndexPath){
        itemStore.move(sourceIndexPath.item, to: destinationIndexPath.item)
    }
    
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath){
        if editingStyle == .Delete{
            itemStore.items.removeAtIndex(indexPath.item)
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Bottom)
        }
    }
   
}

