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
    
    @IBOutlet weak var dueDate: UIDatePicker!
    
    @IBAction func dateSelected(sender: AnyObject) {
        var dateFormatter = NSDateFormatter()
        dateFormatter.dateFormat = "dd-MM-yyyy HH:mm"
        //var strDate = dateFormatter.stringFromDate(dueDate.date)
       // self.dateLabel.text = strDate
        
        let date1:NSDate = dueDate.date
    }

    
    @IBOutlet weak var earnedPointsTextField: UITextField!
    
    @IBOutlet weak var totalPointsTextField: UITextField!
    
    
    
    @IBOutlet weak var categoryPicker: UIPickerView!
    
    @IBAction func addAssignmentButton(sender: AnyObject) {
        
    }
    
    
    
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
