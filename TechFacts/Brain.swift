//
//  Brain.swift
//  TechFacts
//
//  Created by Amanda Milloy on 8/17/16.
//  Copyright © 2016 Amanda Milloy. All rights reserved.
//

import Foundation

class Brain {
    
    // Returns a random fact from  those stored in NSUserDefaults
    func getRandomFact() -> String {
        
        let defaults = NSUserDefaults.standardUserDefaults()
        
        if let arr = defaults.objectForKey("Data") {
            let x = UInt32(arr.count-1)
            let rand = Int(arc4random_uniform(x))
            let fact = String((arr as! [String])[rand])
            return fact
        }
        
        return ""
    }
}
