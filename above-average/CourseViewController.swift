//
//  CourseViewController.swift
//  above-average
//
//  Created by Kyra Drake on 1/15/16.
//  Copyright © 2016 Kyra Drake. All rights reserved.
//

import UIKit

class CourseViewController: UIViewController {
    
    
    @IBOutlet weak var courseMenuButton: UIBarButtonItem!
    
    @IBOutlet weak var courseIdentifierLabel: UILabel!
    
    @IBOutlet weak var courseNameLabel: UILabel!
    
    @IBOutlet weak var courseAverageLabel: UILabel!
    
    @IBOutlet weak var courseCategoriesTable: UITableView!
    
    @IBOutlet weak var courseAssignmentsTable: UITableView!
    
   override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        if self.revealViewController() != nil {
            courseMenuButton.target = self.revealViewController()
            courseMenuButton.action = "revealToggle:"
            self.view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}
