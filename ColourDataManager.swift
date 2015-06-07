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
        loadColours()
    }
    
    // Build colour randomiser
    func convertRGBtoDecimal() -> UIColor {
        var redDecimal:CGFloat
        var greenDecimal:CGFloat
        var blueDecimal:CGFloat

        redDecimal = CGFloat(Int(arc4random_uniform(255))/255)
        greenDecimal = CGFloat(Int(arc4random_uniform(255)))/255
        blueDecimal = CGFloat(Int(arc4random_uniform(255)))/255
        
        return UIColor(red: redDecimal, green: greenDecimal, blue: blueDecimal, alpha: 1.0)
    }

    // ***********************************************************************************************************************************************
    // Need to extract colour values to display in RGB format and perform math operations on for HEX value and lightening or darkening of text colour.
    // ************************************************************************************************************************************************
    
    // set data according to `Colours` struct
    func loadColours() {
        let codeValueTitle = "Colour Code"
        
        // This seems unneccesaryily crude
        var cellColour1 = convertRGBtoDecimal()
        var cellColour2 = convertRGBtoDecimal()
        var cellColour3 = convertRGBtoDecimal()
        var cellColour4 = convertRGBtoDecimal()
        var cellColour5 = convertRGBtoDecimal()
        
        //var newColour = getRed(cellColour1)
        
        colours = [
            Colour(title: codeValueTitle, colourValues: "#00FF00 \(cellColour1)", cellBackgroundColour: cellColour1),
            Colour(title: codeValueTitle, colourValues: "#FF0000 \(cellColour2))", cellBackgroundColour: cellColour2),
            Colour(title: codeValueTitle, colourValues: "#0000FF \(cellColour3))", cellBackgroundColour: cellColour3),
            Colour(title: codeValueTitle, colourValues: "#FF00FF \(cellColour4))", cellBackgroundColour: cellColour4),
            Colour(title: codeValueTitle, colourValues: "#F0F0F0 \(cellColour5))", cellBackgroundColour: cellColour5)
        ]
    }
    
    func findAll() -> [Colour] {
        return colours
    }
    
    
    
    // this function gets the same colours every time.
    //    func getRandomColour() -> UIColor {
    //        var randomRed:CGFloat = CGFloat(drand48())
    //        var randomGreen:CGFloat = CGFloat(drand48())
    //        var randomBlue:CGFloat = CGFloat(drand48())
    //
    //        return UIColor(red:randomRed, green:randomGreen, blue:randomBlue, alpha:1.0)
    //    }
}