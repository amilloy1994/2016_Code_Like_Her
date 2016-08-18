//
//  ViewController.swift
//  TechFacts
//
//  Created by Amanda Milloy on 8/17/16.
//  Copyright © 2016 Amanda Milloy. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var defaults = NSUserDefaults()
    var brain = Brain()
    @IBOutlet weak var fact: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Saves the facts in NSUserDefaults on first run
        if defaults.objectForKey("Data") == nil {
        
            let data = arrayFromContentsOfFileWithName("facts")
            
            defaults.setObject(data, forKey: "Data")
            
        }
        // Creates line breaks in the text
        fact.lineBreakMode = .ByWordWrapping
        fact.numberOfLines = 0
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    // Put a new fact on the screen when the button is pressed
    @IBAction func changeFact() {
        let newFact = brain.getRandomFact()
        fact.text = newFact
    }
    
    
    // Saves the contents of a text file in an array
    func arrayFromContentsOfFileWithName(fileName: String) -> [String]? {
        guard let path = NSBundle.mainBundle().pathForResource(fileName, ofType: "txt") else {
            return nil
        }
        
        do {
            let content = try String(contentsOfFile:path, encoding: NSUTF8StringEncoding)
            return content.componentsSeparatedByString("\n")
        } catch _ as NSError {
            return nil
        }
    }


}

