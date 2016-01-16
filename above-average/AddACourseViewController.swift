//
//  AddACourseViewController.swift
//  above-average
//
//  Created by Kyra Drake on 1/15/16.
//  Copyright © 2016 Kyra Drake. All rights reserved.
//

import UIKit

var semesterArray = [Semester]()

class AddACourseViewController: UIViewController, UITableViewDelegate {
    
    //GENERAL STUFF
    
    @IBOutlet weak var courseTitleTextField: UITextField!
    
    @IBOutlet weak var courseIdentifierTextField: UITextField!
    
    @IBAction func addCourseButton(sender: AnyObject) {
        
        //when the button is pressed, read from the courseTitle and courseIdentifier text fields and create a course
        
        semesterArray[0].addCourse(courseTitleTextField.text!,courseIdentifierTextField.text!)
    }
    
    //ASSIGNMENT CATEGORIES STUFF
    
    @IBOutlet weak var categoryNameTextField: UITextField!
    
    @IBOutlet weak var weightTextField: UITextField!
    
    @IBAction func addCategoryButton(sender: AnyObject) {
        
        //when this button is pressed, read from the categoryName nad weight text fields and create a new assignment category
        
        let weight:Int = Int(weightTextField.text!)!
        tempCategories += [(category:categoryNameTextField.text!, weight:weight, avg:Double(weight))]
        
        print(tempCategories)
        print(tempCategories.count)
        
        assignmentCategoriesTable.reloadData()
        categoryNameTextField.text = ""
        weightTextField.text = ""
    }
    
    //ASSIGNMENT CATEGORIES TABLE STUFF
    
    //add an array for holding the assignment categories
   
    @IBOutlet weak var assignmentCategoriesTable: UITableView!
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tempCategories.count       //return count of the array of assignment categories
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        //how to populate cells... retrieve data from list of assignment categories
        let cell = UITableViewCell(style: UITableViewCellStyle.Default, reuseIdentifier: "Cell")
        
        if tempCategories.count == 0 {
            cell.textLabel?.text = "No Assignment Categories Entered"
        }
        else if tempCategories.count > 0 {
            cell.textLabel?.text = tempCategories[indexPath.row].category + "  " + String(tempCategories[indexPath.row].weight)        //.category] + "  " + tempCategories[indexPath.row.weight]
        }
        else {
            print("Error")
        }
        return cell
    }
    
    func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        
        if editingStyle == UITableViewCellEditingStyle.Delete {     //swipe to the left (delete)
            tempCategories.removeAtIndex(indexPath.row)
            assignmentCategoriesTable.reloadData()
        }
    }
    
    override func viewDidAppear(animated: Bool) {
        assignmentCategoriesTable.reloadData()
    }
    
    //OTHER STUFF
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        assignmentCategoriesTable.reloadData()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}


























