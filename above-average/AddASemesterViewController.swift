//
//  AddASemesterViewController.swift
//  above-average
//
//  Created by Kyra Drake on 1/16/16.
//  Copyright © 2016 Kyra Drake. All rights reserved.
//

import UIKit

var semesterArray: [Semester] = []

class AddASemesterViewController: UIViewController {
    
    @IBAction func addSemesterButton(sender: AnyObject) {
        
        let s = Semester(a: semesterNameTextField.text!)
        semesterArray.append(s)
        
    }
    
    @IBOutlet weak var semesterNameTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}
