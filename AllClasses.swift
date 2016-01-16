import UIKit

class Course {
    var name:String
    var identifier:String
    var assignmentCategories:[(category:String,weight:Int)]
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
    func addCategory(cat:(a:String, b:Int)) {
        // @TODO check if category with that name already exists with for each
        assignmentCategories += [cat] //or use append?
    }
    
    // @TODO update assignment categories
    func updateCategory(cats:[(a:String, b:Int)]) {
        assignmentCategories += cats //or use append?
    }
    
    // @TODO remove assignment category
    func removeCategory(removeMe:String, assignmentCategories:[(a:String, b:Int)]) {
        list = list.filter() { $0 !== removeMe }
    }
    
    // @TODO add assignment
    func addAssignment() {
        assignments += []
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
    func calculateCategory(category:String, weight:Int, assignments:[Assignment]) -> Double {
        var categoryTotal:Double = 0
        for a in assignments {
            categoryTotal += a.finalGrade * Double(weight/100)
        }
        return categoryTotal
    }
}

class Assignment {
    var name:String
    var done:Bool
    var due:Date
    var pointsEarned:Double
    var pointsPossible:Double
    var percentage:Double
    
    init(a:String, b:Bool, c:Date, d:Bool, e:Double, f:Double) {
        name = a
        done = b
        due = c
        pointsEarned = e
        if d == true {
            pointsPossible = f
            percentage = e/f
        } else {
            pointsPossible = 100
            percentage = e            
        } 
    }
    
    
}

class Date {
    init() {
        
    }
}
