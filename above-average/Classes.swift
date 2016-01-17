//
//  Classes.swift
//  above-average
//
//  Created by Kyra Drake on 1/16/16.
//  Copyright © 2016 Kyra Drake. All rights reserved.
//

import Foundation

import UIKit

// Stores constant encoder valus
// Info: https://developer.apple.com/library/ios/referencelibrary/GettingStarted/DevelopiOSAppsSwift/Lesson10.html#//apple_ref/doc/uid/TP40015214-CH14-SW1
struct EncoderKeys {
  static let selfKey = "semester"

  // Assignment Encode/Decode Keys
static let nameKey = "nameKeyStr"
static let categoryKey = "categoryKeyStr"
static let doneKey = "doneKeyStr"
static let dueKey = "dueKeyStr"
static let pointsEarnedKey = "pointsEarnedKeyStr"
static let pointsPossibleKey = "pointsPossibleKeyStr"
static let percentageKey = "percentageKeyStr"
}

class Semester:NSObject {
    var term:String
    var courses:[Course]

    init(a:String) {
        term = a
        courses = []
    }
    
    /*
    // Persistant data writer
    func encodeWithCoder(aCoder: NSCoder){
      aCoder.encodeObject(self, forKey: EncoderKeys.selfKey)
    }

    // Persistant data reader
    required convenience init?(coder aDecoder: NSCoder) {
      let self = aDecoder.decodeObjectForKey(EncoderKeys.selfKey) as! NSObject
    }
    */
    
    func removeCourse(removeMe:String) {
        courses = courses.filter({ $0.name != removeMe })

    }

    func toJSON(){
      var strSemester:String = "semester:{ "
      strSemester = strSemester + "term:'" + term + "',"
      strSemester = strSemester + "courses:["
      for index in 0...courses.count-2{
       // strSemester = strSemester + courses[(index)].toJSON() + ","
      }
     // strSemester = strSemester + courses[courses.count-1].toJSON() + "};"

    }

}

class Course: NSObject {
    var name:String
    var identifier:String
    var assignmentCategories:[(category:String,weight:Int,avg:Double,incat:[Assignment])]
    var assignments:[Assignment]
    var overallPercent:Double

    init(a:String, b:String, c:[(category:String,weight:Int,avg:Double,incat:[Assignment])]) {
        name = a
        identifier = b
        assignmentCategories = c
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
            if !containscat(assignmentCategories,check: element.b){ // add category if it does not exist
                assignmentCategories += [(element.b, element.c, 0.0, [])]
            }else{ // check if category already exists
                for index in 0...assignmentCategories.count-1{
                    if element.b == assignmentCategories[(index)].category{
                        assignmentCategories[(index)] = (element.b, element.c, calculateCategoryAvg(assignmentCategories[(index)].incat),assignmentCategories[(index)].incat)
                    }
                    if !containscata(a,check: assignmentCategories[(index)].category){ // delete the category if it doesn't exist in the new list (might be able to use filter to simplify)
                        assignmentCategories.removeAtIndex((index))
                    }
                }
            }
        }
        for index in 0...assignmentCategories.count-1{
            if !containscata(a,check: assignmentCategories[(index)].category){ // delete the category if it doesn't exist in the new list
            }
        }
    }

    func containscat(a:[(category:String, weight:Int, avg:Double, incat:[Assignment])], check:String) -> Bool {
        for element in a { if element.category == check { return true } }
        return false
    }

    func containscata(a:[(b:String, c:Int)], check:String) -> Bool {
        for element in a { if element.b == check { return true } }
        return false
    }

    // remove assignment category
    func removeCategory(removeMe:String) {
        assignmentCategories = assignmentCategories.filter({ $0.category != removeMe })
    }

    // add assignment
    func addAssignment(a:String, b:String, c:Bool, d:NSDate, e:Double, f:Double) {
        //create assignment
        let temp = Assignment(a: a, b: b, c: c, d: d, e: e, f: f)
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
    func categoryToJSON(category:String, weight:Int, avg:Double, incat:[Assignment]) -> String {
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
        strCourse = strCourse + dataMemb[4] + ":'"  + String(overallPercent) +  "',"
        //categories
        strCourse = strCourse + dataMemb[2] + ":["
        for i:Int in 0..<assignmentCategories.count-1 {
            var Cat = assignmentCategories[i]
            strCourse = strCourse + categoryToJSON(Cat.category,weight: Cat.weight,avg: Cat.avg,incat: Cat.incat) + ","
        }

        //@TODO: ambiguous reference to member 'count'
        var Cat = assignmentCategories[assignmentCategories.count-1]
        strCourse = strCourse + categoryToJSON(Cat.category,weight: Cat.weight,avg: Cat.avg,incat: Cat.incat)
        //assignments
        var AssignArrLast = assignments.count-1;
        for j in 0..<AssignArrLast {

            strCourse = strCourse + assignments[j].toJSON() + ","
        }
        strCourse = strCourse + assignments[assignments.count-1].toJSON()
        return strCourse;
    } //toJSON end

} // Course end

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


class Assignment:NSObject, NSCoding  {
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
    /*
    // Persistant data writer
    func encodeWithCoder(aCoder: NSCoder){
      aCoder.encodeObject(self.name, forKey: EncoderKeys.nameKey)
      aCoder.encodeObject(self.category, forKey: EncoderKeys.categoryKey)
      aCoder.encodeBool(self.done, forKey: EncoderKeys.doneKey)
      aCoder.encodeObject(self.due, forKey: EncoderKeys.dueKey)
      aCoder.encodeDouble(self.pointsEarned, forKey: EncoderKeys.pointsEarnedKey)
      aCoder.encodeDouble(self.pointsPossible, forKey: EncoderKeys.pointsPossibleKey)
      aCoder.encodeDouble(self.percentage, forKey: EncoderKeys.percentageKey)
    }

    // Persistant data reader
    required convenience init?(coder aDecoder: NSCoder) {
      // Decode to NSObject and "downcast" to correct type if needed
      let name = aDecoder.decodeObjectForKey(EncoderKeys.nameKey) as! String
      let category = aDecoder.decodeObjectForKey(EncoderKeys.categoryKey) as! String
      let done = aDecoder.decodeObjectForKey(EncoderKeys.doneKey)
      let due = aDecoder.decodeObjectForKey(EncoderKeys.dueKey) as! NSDate
      let pointsEarned = aDecoder.decodeObjectForKey(EncoderKeys.pointsEarnedKey)
      let pointsPossible = aDecoder.decodeObjectForKey(EncoderKeys.pointsPossibleKey)
      let percentage = aDecoder.decodeObjectForKey(EncoderKeys.percentageKey)
      // Call default init and pass decoded values as arguments
      self.init(name,category,done,due,pointsEarned,pointsPossible,percentage)
    }
    */
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
