import UIKit

class Course {
    var name:String
    var identifier:String
    var assignmentCategories:[(category:String,weight:Int,avg:Double)]
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
    func addCategory(cat:(a:String, b:Int, avg:Double)) {
        // @TODO check if category with that name already exists with for each
        assignmentCategories += [cat] //or use append?
    }
    
    // @TODO add assignment categories on course creation page
    func addOnCreate(cats:[(a:String, b:Int, avg:Double)]) {
        assignmentCategories += cats //or use append?
    }
    
    // @TODO update assignment categories
    func updateCategories() {
        
    }
    
    // @TODO remove assignment category
    func removeCategory(removeMe:String) {
        assignmentCategories = assignmentCategories.filter({ $0.category != removeMe })
    }
    
    // @TODO add assignment
    func addAssignment(a:String, b:Bool, c:Date, d:Double, e:Double) {
        //create assignment
        assignments += [] //or use append?
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
}

class Grade {
    func calculateCategoryAvg(category:String, assignments:[Assignment]) -> Double {
        var categorySum:Double = 0
        var counter:Int = 0
        for a in assignments {
            if a.category == category {
                categorySum += a.percentage
                counter += 1
            }
        }
        return Double(categorySum/Double(counter))
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
    var due:Date
    var pointsEarned:Double
    var pointsPossible:Double
    var percentage:Double
    
    init(a:String, b:String, c:Bool, d:Date, e:Double, f:Double) {
        name = a
        category = b
        done = c
        due = d
        pointsEarned = e
        pointsPossible = f
        percentage = e/f
    }
    
    
}

class Date {
    init() {
        
    }
}
