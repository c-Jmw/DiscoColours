//
//  FavouriteColoursTableViewController.swift
//  DiscoColoursV2
//
//  Created by casey macrae on 2/07/2015.
//  Copyright (c) 2015 casey macrae. All rights reserved.
//

import Foundation
import UIKit

class FavouriteColoursTableViewController: UITableViewController, UITableViewDataSource, UITableViewDelegate {
    // set variable to use in tableView to return favourited colours
    private var favColours:[Colour] = []
    
    override func viewWillAppear(animated: Bool) {
        favColours = ColourDataManager.sharedManager.favColours
        tableView.reloadData()
    }
    
    // get the number of favourited colours and return as integer
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return favColours.count
    }
    
    // setup the data for each cell
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let favColour = favColours[indexPath.row]
        
        var tableViewCell = UITableViewCell(style: UITableViewCellStyle.Subtitle, reuseIdentifier: "colourCell")
        tableViewCell.selectionStyle = .None
        
        // get data from `loadColours` function
        tableViewCell.textLabel?.text = favColour.title
        tableViewCell.textLabel?.textColor = favColour.cellTextColour
        tableViewCell.detailTextLabel?.text = favColour.colourValue
        tableViewCell.detailTextLabel?.textColor = favColour.cellTextColour
        tableViewCell.backgroundColor = favColour.cellBackgroundColour
        
        return tableViewCell
    }
    
    // table cell swipe action
    override func tableView(tableView:UITableView, commitEditingStyle editingStyle:UITableViewCellEditingStyle, forRowAtIndexPath indexPath:NSIndexPath) {
//        var deleteColour: () = ColourDataManager.sharedManager.removeFavouriteColour(favColours[indexPath.row])
//        self.tableView.reloadData()
        
        // use inbuilt methods to remove cell data and cell from view
        if editingStyle == UITableViewCellEditingStyle.Delete {
            favColours.removeAtIndex(indexPath.row)
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: UITableViewRowAnimation.Automatic)
        }
    }
    
    
    @IBAction func shareToFriend(sender: AnyObject) {
        
    }
    
}
