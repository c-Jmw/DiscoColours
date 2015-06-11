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
    
    // ?
    static let sharedManager:ColourDataManager = ColourDataManager()
    
    // initialise colours array
    init() {
        colours = []
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
    
    func findAll() -> [Colour] {
        loadColours()
        return colours
    }

}



// Action Plan
//  - Way to refresh colour scheme (ull to refresh view)
//  - Way to convert UIColor to hex

