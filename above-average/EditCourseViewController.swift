//
//  EditCourseViewController.swift
//  above-average
//
//  Created by Kyra Drake on 1/16/16.
//  Copyright © 2016 Kyra Drake. All rights reserved.
//

import UIKit

class EditCourseViewController: UIViewController {
    
    @IBOutlet weak var courseTitleTextField: UITextField!
    
    @IBOutlet weak var courseIdentifierTextField: UITextField!
    
    @IBAction func saveButton(sender: AnyObject) {
        
        //save course data
    }
    
    //ASSIGNMENT CATEGORIES TABLE STUFF
    
    @IBOutlet weak var assignmentCategoriesTable: UITableView!
    
    @IBOutlet weak var categoryTexttField: UITextField!
    
    @IBOutlet weak var weightTextField: UITextField!
    
    @IBAction func addButton(sender: AnyObject) {
        
        //add an assignment category
    }
    
    //OTHER STUFF
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
