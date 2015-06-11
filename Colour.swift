//
//  Colour.swift
//  DiscoColoursV2
//
//  Created by casey macrae on 4/06/2015.
//  Copyright (c) 2015 casey macrae. All rights reserved.
//

import Foundation
import UIKit

struct Colour {
    var title:String!
    var colourValues:String!
    // This doesn't seem to work initialising without values
    var cellBackgroundColour:UIColor!
    var cellTextColour:UIColor!
    
    init() {
        title = "Colour Value"
        cellBackgroundColour = createRandomColour()
        colourValues = "rgb(\(stringValues()))"
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
        var r:CGFloat = 0
        var g:CGFloat = 0
        var b:CGFloat = 0
        var a:CGFloat = 0
        cellBackgroundColour.getRed(&r, green: &g, blue: &b, alpha: &a)
        
        if (r > 0.5 && r > g && r > b) {
            r -= 0.2
        } else {
            r += 0.2
        }
        if (g > 0.5 && g > r && g > b) {
            g -= 0.2
        } else {
            g += 0.2
        }
        if (b > 0.5 && b > r && b > g) {
            b -= 0.2
        } else {
            b += 0.2
        }
        
//        if (r > 0.5) {
//            r -= 0.3
//        }
//        else {
//            r += 0.3
//        }
//        if (g > 0.5) {
//            g -= 0.3
//        }
//        else {
//            g += 0.3
//        }
//        if (b > 0.5) {
//            b -= 0.3
//        }
//        else {
//            b += 0.3
//        }
        return UIColor(red:r, green: g, blue:b, alpha:1.0)
    }
    
    func stringValues() -> String {
        var r:CGFloat = 0
        var g:CGFloat = 0
        var b:CGFloat = 0
        var a:CGFloat = 0
        cellBackgroundColour.getRed(&r, green: &g, blue: &b, alpha: &a)
        var redInt = (r*255)
        let greenInt = (g*255)
        let blueInt = (b*255)
        return "\(ceil(redInt)), \(ceil(greenInt)), \(ceil(blueInt))"
    }
}