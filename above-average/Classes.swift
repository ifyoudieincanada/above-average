//
//  Classes.swift
//  above-average
//
//  Created by Kyra Drake on 1/16/16.
//  Copyright © 2016 Kyra Drake. All rights reserved.
//

import Foundation

import UIKit

class Semester: NSObject {
    var term:String
    var year:Int
    var courses:[Course]

    init(a:String, b:Int) {
        term = a
        year = b
        courses = []
    }

    func addCourse(a:String, b:String) {
        courses += [Course(a,b)]
    }

    func removeCourse(removeMe:String) {
        courses = courses.filter({ $0.name != removeMe })
    }

    func toJSON(){
      var strSemester:String = "semester:{ "
      strSemester = strSemester + "term:'" + term + "',"
      strSemester = strSemester + "year:'" + String(year) + "',"
      strSemester = strSemester + "courses:["
      for index in 0...courses.count-2{
        strSemester = strSemester + courses[index].toJSON() + ","
      }
      strSemester = strSemester + courses[courses.count-1].toJSON() + "};"
    }

}

class Course: NSObject {
    var name:String
    var identifier:String
    var assignmentCategories:[(category:String,weight:Int,avg:Double,incat:[Assignment])]
    var assignments:[Assignment]
    var overallPercent:Double

    init(a:String, b:String) {
        name = a
        identifier = b
        assignmentCategories = []
        assignments = []
        overallPercent = 0.0
    }

    // add assignment category
    func addCategory(cat:(a:String, b:Int, avg:Double, incat:[Assignment])) {
        assignmentCategories += [cat]
    }

    // add assignment categories on course creation page (can add multiple)
    func addOnCreate(cats:[(a:String, b:Int, avg:Double, incat:[Assignment])]) {
        assignmentCategories += cats
    }

    // update assignment categories
    func updateCategories(a:[(b:String, c:Int)]) {
        for element in a {
            if !containscat(assignmentCategories,element.b){ // add category if it does not exist
                assignmentCategories += [(element.b, element.c, 0.0, [])]
            }else{ // check if category already exists
                for index in 0...assignmentCategories.count-1{
                    if element.b == assignmentCategories[(index)].category{
                        assignmentCategories[(index)] = (element.b, element.c, calculateCategoryAvg(assignmentCategories[(index)].incat),assignmentCategories[(index)].incat)
                    }
                    if !containscat(a,assignmentCategories[(index)].category){ // delete the category if it doesn't exist in the new list (might be able to use filter to simplify)
                        assignmentCategories.removeAtIndex((index))
                    }
                }
            }
        }
        for index in 0...assignmentCategories.count-1{
            if !containscat(a,assignmentCategories[(index)].category){ // delete the category if it doesn't exist in the new list
            }
        }
    }

    func containscat(a:[(b:String, Int, Double, [Assignment])], check:String) -> Bool {
        for element in a { if a.b == check { return true } }
        return false
    }

    func containscat(a:[(b:String, Int)], check:String) -> Bool {
        for element in a { if a.b == check { return true } }
        return false
    }

    // remove assignment category
    func removeCategory(removeMe:String) {
        assignmentCategories = assignmentCategories.filter({ $0.category != removeMe })
    }

    // add assignment
    func addAssignment(a:String, b:String, c:Bool, d:NSDate, e:Double, f:Double) {
        //create assignment
        var temp = Assignment(a: a, b: b, c: c, d: d, e: e, f: f)
        assignments += [temp] //or use append?
    }

    // do the categories add up to 100%
    func weightCheck(assignmentCategories:[(category:String,weight:Int)]) -> Bool {
        var weightTotal:Int = 0
        for a in assignmentCategories {
            weightTotal += a.weight
        }
        if weightTotal == 100 {
            return true
        } else {
            return false
        }
    }

    // Converts a catagory triple into a JSON string
    func categoryToJSON(cat:String, weight:Int, avg:Double) -> String{
      var lbl = ["name","weight","avg"]
      var strCat:String = "{ "
      strCat = strCat + lbl[0] + ":'" + String(name)   + "'" + ","
      strCat = strCat + lbl[1] + ":'" + String(weight) + "'" + ","
      strCat = strCat + lbl[2] + ":'" + String(avg)    + "'"
      strCat = strCat + "}" // Commas will be added between weights by handler
      return strCat
    }

    // Converts and groups instance's elements into JSON compatible string
    func toJSON() -> String {
      var strCourse:String = "{ "
      var dataMemb = ["name","id","categories","assignments","overall"]
      // course info
      strCourse = strCourse + dataMemb[0] + ":'"  + name +            "',"
      strCourse = strCourse + dataMemb[1] + ":'"  + identifier +      "',"
      strCourse = strCourse + dataMemb[4] + ":'"  + overallPercent +  "',"
      //categories
      strCourse = strCourse + dataMemb[2] + ":["
      for index in 0...assignmentCategories.count-2{
        strCourse = strCourse + categoryToJSON(assignmentCategories[index]) + ","
      }
      strCourse = strCourse + categoryToJSON(assignmentCategories[assignmentCategories.count-1])
      //assignments
      for index in 0...assignments.count-2{
        strCourse = strCourse + assignments[index].toJSON() + ","
      }
      strCourse = strCourse + assignments[assignments.count-1].toJSON()
      return strCourse;
    } //toJSON end
} // Course end

class Grade: NSObject {
    func calculateCategoryAvg(assignments:[Assignment]) -> Double {
        var categorySum:Double = 0
        for a in assignments {
            categorySum += a.percentage
        }
        return Double(categorySum/Double(assignments.count))
    }

    func calculateWeightedTotal(assignmentCategories:[(category:String,weight:Int,avg:Double)]) -> Double {
        var overall:Double = 0
        for a in assignmentCategories {
            overall += a.avg * Double(a.weight/100)
        }
        return overall
    }
}

class Assignment {
    var name:String
    var category:String
    var done:Bool
    var due:NSDate
    var pointsEarned:Double
    var pointsPossible:Double
    var percentage:Double

    init(a:String, b:String, c:Bool, d:NSDate, e:Double, f:Double) {
        name = a
        category = b
        done = c
        due = d
        pointsEarned = e
        pointsPossible = f
        percentage = e/f
    }

    // Converts an Assignment class to a small JSON class
    func toJSON() -> String{
      var strAssignment:String = "{ "
      let dateFormatter = NSDateFormatter()
      dateFormatter.dateFormat = "dd-MM-yyyy HH:mm"
      let dueAsString = dateFormatter.stringFromDate(due)
      // Build JSON String
      strAssignment = strAssignment + "name:'" + name + "', "
      strAssignment = strAssignment + "catagory:'" + category + "',"
      if done {
        strAssignment += " done:'true',"
      } else {
        strAssignment += " done:'false',"
      }
      strAssignment = strAssignment +  " due:'" + dueAsString + "',"
      strAssignment = strAssignment + " earned:'" + String(pointsEarned) + "',"
      strAssignment = strAssignment + " possible:'" + String(pointsPossible) + "',"
      strAssignment = strAssignment + " percent:'" + String(percentage) + "'"
      strAssignment += "}"  // Commas will be added by a handling class
      return strAssignment;
    }

}
