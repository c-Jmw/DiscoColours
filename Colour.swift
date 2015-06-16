//
//  Colour.swift
//  DiscoColoursV2
//
//  Created by casey macrae on 4/06/2015.
//  Copyright (c) 2015 casey macrae. All rights reserved.
//

import Foundation
import UIKit

class Colour {
    var title:String!
    var colourValue:String!
    // This doesn't seem to work initialising without values
    var cellBackgroundColour:UIColor!
    var cellTextColour:UIColor!
    
    init() {
        title = "Colour Value"
        cellBackgroundColour = createRandomColour()
        colourValue = "rgb(\(stringValues()))"
        cellTextColour = getTextColour()
    }
    
    // Build colour randomiser
    func createRandomColour() -> UIColor {
        var redDecimal:CGFloat
        var greenDecimal:CGFloat
        var blueDecimal:CGFloat
        
        redDecimal = CGFloat(Int(arc4random_uniform(255)))/255
        greenDecimal = CGFloat(Int(arc4random_uniform(255)))/255
        blueDecimal = CGFloat(Int(arc4random_uniform(255)))/255
        
        return UIColor(red: redDecimal, green: greenDecimal, blue: blueDecimal, alpha: 1.0)
    }
    
    // create subtle colours for text
    func getTextColour() -> UIColor {
        
        // create variables for `getRed()` value returns
        var r:CGFloat = 0
        var g:CGFloat = 0
        var b:CGFloat = 0
        var a:CGFloat = 0
        cellBackgroundColour.getRed(&r, green: &g, blue: &b, alpha: &a)
        
        // set text colour to be lighter or darker than background
        if ((r+g+b) >= 1.2 || r > 0.78 || g > 0.78 || b > 0.78 ) {
            r = 0.0; g = 0.0; b = 0.0
        } else {
            r = 1.0; g = 1.0; b = 1.0
        }
        
        return UIColor(red:r, green: g, blue:b, alpha:0.3)
    }
    
    func stringValues() -> String {
        var r:CGFloat = 0
        var g:CGFloat = 0
        var b:CGFloat = 0
        var a:CGFloat = 0
        cellBackgroundColour.getRed(&r, green: &g, blue: &b, alpha: &a)
        var redInt = ceil(r*255)
        let greenInt = ceil(g*255)
        let blueInt = ceil(b*255)
        return "\(Int(redInt)), \(Int(greenInt)), \(Int(blueInt))"
    }
}