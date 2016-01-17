//
//  AddAnAssignmentViewController.swift
//  above-average
//
//  Created by Kyra Drake on 1/16/16.
//  Copyright © 2016 Kyra Drake. All rights reserved.
//

import UIKit

class AddAnAssignmentViewController: UIViewController, UITextFieldDelegate {
    
    var date = NSDate ()
    
    @IBOutlet weak var assignmentNameTextField: UITextField!
    
    @IBOutlet weak var dueDate: UIDatePicker!
    
    @IBAction func dateSelected(sender: AnyObject) {
        var dateFormatter = NSDateFormatter()
        dateFormatter.dateFormat = "dd-MM-yyyy HH:mm"
        //var strDate = dateFormatter.stringFromDate(dueDate.date)
       // self.dateLabel.text = strDate
        
        date = dueDate.date
    }

    
    @IBOutlet weak var earnedPointsTextField: UITextField!
    
    @IBOutlet weak var totalPointsTextField: UITextField!
    
    
    @IBAction func addAssignmentButton(sender: AnyObject) {
        
        let a = Assignment(a: assignmentNameTextField.text!, b: String(categoryPicker), c: true, d: date, e: Double(earnedPointsTextField.text!)!, f: Double(totalPointsTextField.text!)!)
        //a.name = assignmentNameTextField.text
        
        //semesterArray[semesterArrayIndex].courses[courseIndex].assignments.append(a)
        semesterArray[semesterArrayIndex].courses[courseIndex].addAssignment(assignmentNameTextField.text!, b: String(categoryPicker), c: true, d: date, e: Double(earnedPointsTextField.text!)!, f: Double(totalPointsTextField.text!)!)
    }
    
    //PICKER
    
    @IBOutlet weak var categoryPicker: UIPickerView!
    
    var pickerData: [String] = [String]()
    

    // OTHER STUFF
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        
        //populate picker
        for x in semesterArray[semesterArrayIndex].courses[courseIndex].assignmentCategories
        {
            pickerData.append(x.category)
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}








