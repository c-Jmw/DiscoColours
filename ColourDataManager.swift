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
        let codeValueTitle = "Colour Code"
        colours = [
            Colour(title: codeValueTitle, colourValues: "#00FF00 rgb(0, 255, 0)"),
            Colour(title: codeValueTitle, colourValues: "#FF0000 rgb(255, 0, 0)")
        ]
    }
    
    func findAll() -> [Colour] {
        return colours
    }
}