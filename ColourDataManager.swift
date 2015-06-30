//
//  ColourDataManager.swift
//  DiscoColoursV2
//
//  Created by casey macrae on 4/06/2015.
//  Copyright (c) 2015 casey macrae. All rights reserved.
//

import Foundation
import UIKit

let COLOURS_KEY = "colours"

class ColourDataManager {
    private var colours:[Colour] = []
    var favColours:[Colour] = []
    
    // ?
    static let sharedManager:ColourDataManager = ColourDataManager()
    
    // initialise colours array
    init() {
        colours = []
        favColours = []
        
        loadFavColours()
    }
    
    // set data according to `Colours` struct
    func loadColours() {
        colours = [
            Colour(),
            Colour(),
            Colour(),
            Colour(),
            Colour(),
            Colour(),
            Colour()
        ]
    }
    
    func loadFavColours() {
//        if let coloursObject:AnyObject = NSUserDefaults.standardUserDefaults().objectForKey(COLOURS_KEY) {
//            favColours = coloursObject as! [Colour]
//        }
    }
    
    private func saveFavColours() {
        println("Number of fav colours is \(favColours.count)")
//        NSUserDefaults.standardUserDefaults().setObject(favColours, forKey: COLOURS_KEY)
    }
    
    // Collect all instances of `Colour`
    func findAll() -> [Colour] {
        loadColours()
        return colours
    }
    
    func addFavouriteColour(selectedColour:Colour) {
        // Add this to favColours
        favColours.append(selectedColour)
        saveFavColours()
        
        // Save to NSUserDefaults
    }
    
    func removeFavouriteColour(colour:Colour) {
        // Find a colour instance in favColours that is the exact same isntance as the color passed in
        for (index, favColour) in enumerate(favColours) {
            if colour === favColour {
                favColours.removeAtIndex(index)
                break
            }
        }
        
        saveFavColours()
    }
    
//    private func getArchivedColors() -> [NSData] {
//        var coloursData:[NSData] = []
//        
//        for colour in favColours {
//            coloursData.append(NSKeyedArchiver.archivedDataWithRootObject(colour.cellBackgroundColour))
//        }
//        
//        return coloursData
//    }
//    
//    private func getUnArchiveColours() -> [Colour] {
//        var unArchivedColours:[Colour] = []
//        
//        if let coloursDataObject:AnyObject = NSUserDefaults.standardUserDefaults().objectForKey(COLOURS_KEY) {
//            if let coloursData = coloursDataObject as? [NSData] {
//                for colourData in coloursData {
//                    let colourValue:UIColor = NSKeyedUnarchiver.unarchiveObjectWithData(colourData) as! UIColor
//                    unArchivedColours.append(Colour(cellBackgroundColour: colourValue))
//                }
//                
//            }
//        }
//        return unArchivedColours
//    }
}



// Action Plan
//  - Way to refresh colour scheme (ull to refresh view)
//  - Way to convert UIColor to hex

