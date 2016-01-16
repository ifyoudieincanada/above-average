//
//  CoursesListViewController.swift
//  above-average
//
//  Created by Kyra Drake on 1/15/16.
//  Copyright © 2016 Kyra Drake. All rights reserved.
//

import UIKit

class CoursesListViewController: UIViewController {
    
    @IBOutlet weak var menuButton: UIBarButtonItem!
    
    @IBOutlet weak var semesterCoursesTable: UITableView!
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //return 1
        return courseArray.count        //return number of courses in the semester
    }
    
    var objects: NSMutableArray! = NSMutableArray()
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {

        let cell = UITableViewCell(style: UITableViewCellStyle.Default, reuseIdentifier: "Cell")
        
        cell.accessoryType = .DetailDisclosureButton
        
        //cell.textLabel?.text = "cell"
        //cell.textLabel?.text = courseArray[indexPath.row].name + "  " + String(courseArray[indexPath.row].overallPercent)
        //cell.button.tag = indexPath.row
        
        return cell
    }
    
    func tableView(tableView: UITableView, accessoryButtonTappedForRowWithIndexPath indexPath: NSIndexPath) {
        //doSomethingWithItem(indexPath.row)
        var index = indexPath.row

    }
    
    func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        
        if editingStyle == UITableViewCellEditingStyle.Delete {     //swipee to the left (delete)
            
            courseArray.removeAtIndex(indexPath.row)
            
            semesterCoursesTable.reloadData()
        }
    }
    
    override func viewDidAppear(animated: Bool) {
        
        semesterCoursesTable.reloadData()
    }

    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = self.tableView.dequeueReusableCellWithIdentifier("cell", forIndexPath: indexPath) as! SemesterTableCell
        
        cell.titleLabel.text = self.objects.objectAtIndex(indexPath.row) as? String
        cell.logButton.tag = indexPath.row;
        cell.logButton.addTarget(self, action: "logAction:", forControlEvents: .TouchUpInside)
        return cell

    func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        /*
        if self.revealViewController() != nil {
            menuButton.target = self.revealViewController()
            menuButton.action = "revealToggle:"
            self.view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
        }*/
    }
    
    func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}
















/*
import UIKit

//var courseArray = [Course]()

class CoursesListViewController: UIViewController {
    
    
    //@IBOutlet weak var semesterMenuButton: UIBarButtonItem!
    
    @IBOutlet weak var semesterCoursesTable: UITableView!
    
    //SEMESTER COURSES TABLE STUFF
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
       // return courseArray.count        //return number of courses in the semester
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = UITableViewCell(style: UITableViewCellStyle.Default, reuseIdentifier: "Cell")
        
        cell.textLabel?.text = "cell"
        //cell.textLabel?.text = courseArray[indexPath.row].name + "  " + String(courseArray[indexPath.row].overallPercent)
        
        return cell
    }
    
    func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        
        if editingStyle == UITableViewCellEditingStyle.Delete {     //swipee to the left (delete)
            
            //toDoList.removeAtIndex(indexPath.row)
            
            //semesterCoursesTable.reloadData()
        }
    }
    
    override func viewDidAppear(animated: Bool) {
        
        semesterCoursesTable.reloadData()
    }
    
    //OTHER STUFF
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        /*
        if self.revealViewController() != nil {
            semesterMenuButton.target = self.revealViewController()
            semesterMenuButton.action = "revealToggle:"
            self.view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
        }*/
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
*/
