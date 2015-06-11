//
//  TableViewController.swift
//  DiscoColoursV2
//
//  Created by casey macrae on 4/06/2015.
//  Copyright (c) 2015 casey macrae. All rights reserved.
//

import UIKit

class TableViewController: UITableViewController, UITableViewDataSource, UITableViewDelegate {
    
    private var colours:[Colour] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        refreshColours()
    }
    
    func refreshColours() {
        colours = ColourDataManager.sharedManager.findAll()
    }
    
    // get number of rows according to loadColours items
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return colours.count
    }
    
    
    // create table cell and populate with data
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        // ?
        let colour = colours[indexPath.row]
        
        // ?
        var tableViewCell = UITableViewCell(style: UITableViewCellStyle.Subtitle, reuseIdentifier: "")
        
        // get data from `loadColours` function
        tableViewCell.textLabel?.text = colour.title
        tableViewCell.textLabel?.textColor = colour.cellTextColour
        tableViewCell.detailTextLabel?.text = colour.colourValues
        tableViewCell.detailTextLabel?.textColor = colour.cellTextColour
        tableViewCell.backgroundColor = colour.cellBackgroundColour
        //tableViewCell.backgroundColor = convertRGBtoDecimal(randomRGBColourValue, green: randomRGBColourValue, blue: randomRGBColourValue)
        
        
        // send out fully populated table cell
        return tableViewCell
    }

    @IBAction func onRefreshTapped(sender: AnyObject) {
        refreshColours()
        self.tableView.reloadData()
    }
}
