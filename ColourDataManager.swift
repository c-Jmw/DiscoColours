//
//  ColourDataManager.swift
//  DiscoColoursV2
//
//  Created by casey macrae on 4/06/2015.
//  Copyright (c) 2015 casey macrae. All rights reserved.
//

import Foundation

class ColourDataManager {
    private var colours:[Colour]
    
    // ?
    static let sharedManager:ColourDataManager = ColourDataManager()
    
    // initialise colours array
    init() {
        colours = []
        loadColours()
    }
    
    // set data according to `Colours` struct
    func loadColours() {
        colours = [
            Colour(title: "Hex Value", colourCodeValue: "#FF0000"),
            Colour(title: "RGB Value", colourCodeValue: "rgb(255, 0, 0)")
        ]
    }
    
    func findAll() -> [Colour] {
        return colours
    }
}