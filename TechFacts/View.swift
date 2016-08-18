//
//  View.swift
//  TechFacts
//
//  Created by Amanda Milloy on 8/17/16.
//  Copyright © 2016 Amanda Milloy. All rights reserved.
//

import UIKit

@IBDesignable

class View: UIView {
    
    @IBInspectable var startColor: UIColor = UIColor.redColor() { didSet { setNeedsDisplay() }}
    @IBInspectable var endColor: UIColor = UIColor.greenColor() { didSet { setNeedsDisplay() }}
    
    override func drawRect(rect: CGRect) {
        
        
        // Creates and draws a color gradient
        let context = UIGraphicsGetCurrentContext()
        let colors = [startColor.CGColor, endColor.CGColor]
        let colorSpace = CGColorSpaceCreateDeviceRGB()
        let colorLocations:[CGFloat] = [0.0, 1.0]
        let gradient = CGGradientCreateWithColors(colorSpace, colors, colorLocations)
        let startPoint = CGPoint.zero
        let endPoint = CGPoint(x:0, y:self.bounds.height)
        CGContextDrawLinearGradient(context,
                                    gradient,
                                    startPoint,
                                    endPoint,
                                    CGGradientDrawingOptions(rawValue: 0))
        
        
        
    }
    


}
