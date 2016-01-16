//
//  AddAnAssignmentViewController.swift
//  above-average
//
//  Created by Kyra Drake on 1/16/16.
//  Copyright © 2016 Kyra Drake. All rights reserved.
//

import UIKit

class AddAnAssignmentViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var assignmentNameTextField: UITextField!
    
   // @IBOutlet weak var dueDateTextField: UITextField!
    
    @IBOutlet weak var dueDate: UIDatePicker!
    
    @IBOutlet weak var earnedPointsLabel: UILabel!
    
    @IBOutlet weak var totalPointsLabel: UILabel!
    
    @IBOutlet weak var earnedPointsTextField: UITextField!
    
    @IBOutlet weak var totalPointsTextField: UITextField!
    
    // OTHER STUFF
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
