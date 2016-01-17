//
//  Menu.swift
//  above-average
//
//  Created by Kyra Drake on 1/16/16.
//  Copyright © 2016 Kyra Drake. All rights reserved.
//

import UIKit

var semesterArray = [Semester]()
var semesterArrayIndex = 0
var courseIndex = 0

class Menu: UIViewController {
    
    @IBAction func ClassSelectionButton(sender: AnyObject) {
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        if (NSUserDefaults.standardUserDefaults().objectForKey("semesterArray") != nil) {
            semesterArray = NSUserDefaults.standardUserDefaults().objectForKey("semesterArray") as! [Semester]
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
