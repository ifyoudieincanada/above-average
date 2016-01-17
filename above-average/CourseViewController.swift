//
//  CourseViewController.swift
//  above-average
//
//  Created by Kyra Drake on 1/15/16.
//  Copyright © 2016 Kyra Drake. All rights reserved.
//

import UIKit

class CourseViewController: UIViewController, UITableViewDelegate {
    
    
    @IBOutlet weak var courseMenuButton: UIBarButtonItem!
    
    @IBOutlet weak var courseIdentifierLabel: UILabel!
    
    @IBOutlet weak var courseNameLabel: UILabel!
    
    @IBOutlet weak var courseAverageLabel: UILabel!
    
    @IBOutlet weak var courseAssignmentsTable: UITableView!
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return semesterArray[semesterArrayIndex].courses[courseIndex].assignments.count;
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = UITableViewCell(style: UITableViewCellStyle.Default, reuseIdentifier: "Cell")

        cell.textLabel?.text = semesterArray[semesterArrayIndex].courses[courseIndex].assignments[indexPath.row].name + "  " + String(semesterArray[semesterArrayIndex].courses[courseIndex].assignments[indexPath.row].percentage)

        return cell
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        courseIdentifierLabel.text = semesterArray[semesterArrayIndex].courses[courseIndex].identifier
        
        courseNameLabel.text = semesterArray[semesterArrayIndex].courses[courseIndex].name
        
        courseAverageLabel.text = String(semesterArray[semesterArrayIndex].courses[courseIndex].overallPercent)
        
        /*
        if self.revealViewController() != nil {
            courseMenuButton.target = self.revealViewController()
            courseMenuButton.action = "revealToggle:"
            self.view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
        }
        */
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}
