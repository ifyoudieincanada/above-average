// JESSICA
class Course {
    var name:String
    var identifier:String
    var assignmentCategories:[(category:String,weight:Int)]
    var assignments:[Assignment]
    var overallPercent:Double

    init() {
    }
    // @TODO add assignment category
    // @TODO remove assignment category
    
    // do the categories add up to 100%
    func weightCheck(assignmentCategories) -> Bool {
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

// JESSICA
class Grade {
    func calculateCategory(category:String, weight:Int, assignments:[Assignment]) -> Double {
        var categoryTotal:Double = 0
        for a in assignments {
            categoryTotal += a.finalGrade * weight/100
        }
        return categoryTotal
    }
}

// Nick
class Assignment {
    var assignmentName:String
    var done:Bool
    var assignmentDate:Date
    var dueDate:Date
    var pointsPossible:Double
    var pointsEarned:Double
    var finalGrade:Double
    init() {
      //@TODO: Figure out how to take in variables
    }

}

class Date {
    init() {
    
    }
}
