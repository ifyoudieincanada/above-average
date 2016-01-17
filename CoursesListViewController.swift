//
//  CoursesListViewController.swift
//  above-average
//
//  Created by Kyra Drake on 1/15/16.
//  Copyright © 2016 Kyra Drake. All rights reserved.
//

import UIKit

//semesterArrayIndex
class CoursesListViewController: UIViewController, UITableViewDelegate {
    
    @IBOutlet weak var menuButton: UIBarButtonItem!
    
    @IBOutlet weak var semesterCoursesTable: UITableView!
    
    @IBOutlet weak var semesterNameLabel: UILabel!
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       if semesterArray.count == 0 {
            return 0
        }
        else {
            return semesterArray[semesterArrayIndex].courses.count
        }
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {

        let cell = UITableViewCell(style: UITableViewCellStyle.Default, reuseIdentifier: "Cell")
        cell.accessoryType = .DetailDisclosureButton
        cell.textLabel?.text = semesterArray[semesterArrayIndex].courses[indexPath.row].name + "  " + String(semesterArray[semesterArrayIndex].courses[indexPath.row].overallPercent)
        return cell
    }

    func tableView(tableView: UITableView, accessoryButtonTappedForRowWithIndexPath indexPath: NSIndexPath) {
        let index = indexPath.row
        print(index)
        print("jkalsnvkdlsankldvkmsaksdnvdlsaksnvkldsnaklsnkglnasklcmlajewkn")
        courseIndex = index
        performSegueWithIdentifier("goToCourse", sender: self)
    }
    
    /*
    func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {

        if editingStyle == UITableViewCellEditingStyle.Delete {     //swipee to the left (delete)

            toDoList.removeAtIndex(indexPath.row)

            NSUserDefaults.standardUserDefaults().setObject(toDoList, forKey: "toDoList")

            toDoListTable.reloadData()
        }
    }
*/

    override func viewDidAppear(animated: Bool) {
        semesterCoursesTable.reloadData()
        
        //semesterNameLabel.text = semesterArray[semesterArrayIndex].term
    }


    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        if self.revealViewController() != nil {
            menuButton.target = self.revealViewController()
            menuButton.action = "revealToggle:"
            self.view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
        }
    }
    
    override func didReceiveMemoryWarning() {
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
