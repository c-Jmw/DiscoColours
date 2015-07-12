//
//  TableViewController.swift
//  DiscoColoursV2
//
//  Created by casey macrae on 4/06/2015.
//  Copyright (c) 2015 casey macrae. All rights reserved.
//

import UIKit
import Foundation

class ColoursTableViewController: UITableViewController, UITableViewDataSource, UITableViewDelegate {
    
    private var colours:[Colour] = []
    private var undoManagerList:NSUndoManager?
    private var redoMangerList:NSUndoManager?
    private var userCellSelection:UITableViewRowAction?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        refreshColours()
        undoManagerList = NSUndoManager()
        redoMangerList = NSUndoManager()
        userCellSelection = UITableViewRowAction()
    }
    
    func refreshColours() {
        colours = ColourDataManager.sharedManager.findAll()
    }
    
    func rewindColours(coloursin:[Colour]) {
        colours = coloursin
        self.tableView.reloadData()
    }
    
    func redoRewoundColours(coloursof:[Colour]) {
        colours = coloursof
        self.tableView.reloadData()
    }
    
    // get number of rows according to loadColours items
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return colours.count

    }
    
    // Get screen height of device to determine table row height for 7 cells to fill screen
    override func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        var screenSize = UIScreen.mainScreen().bounds
        var screenHeight = screenSize.size.height / 8.32
        return screenHeight
    }
    
    // create table cell and populate with data
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        // ?
        let colour = colours[indexPath.row]
        
        // ?
        var tableViewCell = UITableViewCell(style: UITableViewCellStyle.Subtitle, reuseIdentifier: "")
        tableViewCell.selectionStyle = .None
        
        // get data from `loadColours` function
        tableViewCell.textLabel?.text = colour.title
        tableViewCell.textLabel?.textColor = colour.cellTextColour
        tableViewCell.detailTextLabel?.text = colour.colourValue
        tableViewCell.detailTextLabel?.textColor = colour.cellTextColour
        tableViewCell.backgroundColor = colour.cellBackgroundColour
        
        
        // send out fully populated table cell
        return tableViewCell
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        let cell = tableView.cellForRowAtIndexPath(indexPath)
        let colour = colours[indexPath.row]
        
        // Toggle between checked/unchecked state
        // TODO If checked, record favourited colour
        switch (cell!.accessoryType) {
        case .Checkmark:
            cell?.accessoryType = UITableViewCellAccessoryType.None
            ColourDataManager.sharedManager.removeFavouriteColour(colour)
        default:
            cell?.accessoryType = UITableViewCellAccessoryType.Checkmark
            ColourDataManager.sharedManager.addFavouriteColour(colour)
        }
        
    }
    
    @IBAction func onRefreshTapped(sender: AnyObject) {
        
        if let oldColoursList = undoManagerList {
            oldColoursList.registerUndoWithTarget(self, selector:Selector("rewindColours:"), object: colours)
        }
        
        refreshColours()
        self.tableView.reloadData()
        
    }
    
    @IBAction func undoButton(sender: AnyObject) {
        
        if let undoneColoursList = redoMangerList {
            undoneColoursList.registerUndoWithTarget(self, selector:Selector("redoRewoundColours:"), object: colours)
        }
        self.undoManagerList!.undo()
    }
    
    @IBAction func redoButton(sender: AnyObject) {
        self.redoMangerList!.undo()
    }
}
