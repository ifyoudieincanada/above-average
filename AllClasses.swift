// JESSICA
class Course{
    var name:String
    var identifier:String
    var assignmentCategories:[(category:String,weight:Int)]
    var assignments:[Assignment]
    var overallPercent:Double

    init(){
    }
    // @TODO add assignment category
    // @TODO remove assignment category
    // @TODO do the categories add up to 100%?
}

// Nick
class Assignment{
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
