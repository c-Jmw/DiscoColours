//
//  ColourDataManager.swift
//  DiscoColoursV2
//
//  Created by casey macrae on 4/06/2015.
//  Copyright (c) 2015 casey macrae. All rights reserved.
//

import Foundation
import UIKit

class ColourDataManager {
    private var colours:[Colour]
    var favColours:[Colour]
    
    // ?
    static let sharedManager:ColourDataManager = ColourDataManager()
    
    // initialise colours array
    init() {
        colours = []
        favColours = [] // TODO: Load from NSUserDefaults
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
    
    // Collect all instances of `Colour`
    func findAll() -> [Colour] {
        loadColours()
        return colours
    }
    
    func addFavouriteColour(selectedColour:Colour) {
        // Add this to favColours
        favColours.append(selectedColour)
        
        // Save to NSUserDefaults
    }
    
    func removeFavouriteColour(colour:Colour) {
        // Find a colour instance in favColours that is the exact ame isntance as the color passed in
        // Remove it from array
        // Save
    }
    
    private func saveFavColours() {
        // Save favColours to NSUserDefaults
    }

}



// Action Plan
//  - Way to refresh colour scheme (ull to refresh view)
//  - Way to convert UIColor to hex

