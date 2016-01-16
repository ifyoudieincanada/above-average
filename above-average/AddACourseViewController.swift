//
//  AddACourseViewController.swift
//  above-average
//
//  Created by Kyra Drake on 1/15/16.
//  Copyright © 2016 Kyra Drake. All rights reserved.
//

import UIKit

var courseArray = [Course]()

class AddACourseViewController: UIViewController, UITableViewDelegate {
    
    //GENERAL STUFF
    
    var c:Course?
    var tempCategories = [(category:String,weight:Int,avg:Double)]()
    var counter = 0
    
    @IBOutlet weak var courseTitleTextField: UITextField!
    
    @IBOutlet weak var courseIdentifierTextField: UITextField!
    
    @IBAction func addCourseButton(sender: AnyObject) {
        
        //when the button is pressed, read from the courseTitle and courseIdentifier text fields and create a course
        
        c = Course(a: courseTitleTextField.text!, b: courseIdentifierTextField.text!)
        
        c?.assignmentCategories
        
        courseArray.append(c!)
        
        //print(c)
    }
    
    //ASSIGNMENT CATEGORIES STUFF
    
    @IBOutlet weak var categoryNameTextField: UITextField!
    
    @IBOutlet weak var weightTextField: UITextField!
    
    @IBAction func addCategoryButton(sender: AnyObject) {
        
        //when this button is pressed, read from the categoryName nad weight text fields and create a new assignment category
        
        let weight:Int = Int(weightTextField.text!)!
        
        tempCategories[counter] = (category:categoryNameTextField.text!, weight:weight, avg:Double(weight))
        //c?.addCategory((a:categoryNameTextField.text!, b:weight, avg:Double(weight)))
        counter++
    }
    
    //ASSIGNMENT CATEGORIES TABLE STUFF
    
    //add an array for holding the assignment categories
    
    @IBOutlet weak var assignmentCategoriesTable: UITableView!
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return 1        //return count of the array of assignment categories
    
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        //how to populate cells... retrieve data from list of assignment categories
        let cell = UITableViewCell(style: UITableViewCellStyle.Default, reuseIdentifier: "Cell")
        
        //cell.textLabel?.text = toDoList[indexPath.row]
        
        return cell
    }
    
        /*
    func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        
        if editingStyle == UITableViewCellEditingStyle.Delete {     //swipe to the left (delete)
            
            //toDoList.removeAtIndex(indexPath.row)
            
            //assignmentCategoriesTable.reloadData()
        }
    }
    
    override func viewDidAppear(animated: Bool) {
        
        //toDoListTable.reloadData()
    }
    
    //OTHER STUFF*/
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}

