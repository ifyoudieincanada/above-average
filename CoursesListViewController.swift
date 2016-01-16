//
//  CoursesListViewController.swift
//  above-average
//
//  Created by Kyra Drake on 1/15/16.
//  Copyright © 2016 Kyra Drake. All rights reserved.
//

import UIKit

class CoursesListViewController: UIViewController {
    
    
    @IBOutlet weak var semesterMenuButton: UIBarButtonItem!
    
    @IBOutlet weak var semesterCoursesTable: UITableView!
    
    //SEMESTER COURSES TABLE STUFF
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return 1        //return number of courses in the semester
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = UITableViewCell(style: UITableViewCellStyle.Default, reuseIdentifier: "Cell")
        
        //cell.textLabel?.text = toDoList[indexPath.row]
        
        return cell
    }
    
    func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        
        if editingStyle == UITableViewCellEditingStyle.Delete {     //swipee to the left (delete)
            
            //toDoList.removeAtIndex(indexPath.row)
            
            semesterCoursesTable.reloadData()
        }
    }
    
    override func viewDidAppear(animated: Bool) {
        
        semesterCoursesTable.reloadData()
    }
    
    //OTHER STUFF
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        if self.revealViewController() != nil {
            semesterMenuButton.target = self.revealViewController()
            semesterMenuButton.action = "revealToggle:"
            self.view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
