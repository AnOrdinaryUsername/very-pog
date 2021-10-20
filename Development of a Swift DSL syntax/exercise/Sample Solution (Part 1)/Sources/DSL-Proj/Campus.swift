//
//  Campus.swift
//  
//
//  Created by James Shen on 9/15/21.
//

enum Gender : String {
    case male = "male"
    case female = "female"
}

class Person {
    var firstName : String
    var middleName : String?
    var lastName : String
    
    var gender : Gender
    // Year of birth (optional)
    // var dob : Date?
    // Define a computed property 'age'
    
    var spouse : Person?
    var children : [Person]?
    
    // computed property - getter
    var fullName : String {
        get {
            if let m = middleName {
                return("\(firstName) \(m) \(lastName)")
            } else {
                return("\(firstName) \(lastName)")
            }
        }
    }
    
    // closure (+ type inference)
    lazy var fullName1 : String = {
        if let m = $1 {
            return("\($0) \(m) \($2)")
        } else {
            return("\($0) \($2)")
        }
    }(firstName, middleName, lastName)
    
    required init?(fn : String, ln : String, g : Gender) {
        if fn.isEmpty || ln.isEmpty {
            return nil
        }
        firstName = fn
        lastName = ln
        gender = g
    }
    
    func getLabel() -> String {
        let label = "\(fullName)"
        return label
    }
}


class CampusMember : Person {
    var cwid : String
    
    init?(_ id : String, _ fn : String, _ ln : String, _ g : Gender) {
       cwid = id
        super.init(fn : fn, ln: ln, g: g)
    }

    required init?(fn : String, ln : String, g : Gender) {
        self.cwid = ""
        super.init(fn : fn, ln : ln, g : g)
    }
    
    convenience init?(id : String, p : Person) {
        self.init(id, p.firstName, p.lastName, p.gender)
    }
    
    override func getLabel() -> String {
        var label = "\(fullName) \(cwid)"
        var title : String
        switch gender {
            case .female: title = "Ms. "
            case .male: title = "Mr. "
        }
        label = "\(title) \(fullName) \(cwid)"
        return label
    }
}

// Singleton object
class CSUF {
    static var departments : [String : Department] = {
        var dList = [String : Department]()
        dList["Computer Science"] = Department("Computer Science")
        dList["Mathmatics"] = Department("Mathmetics")
        return dList
    }()
}

class Department {
    var name : String
    var studentList : [Student]?
    
    // Exercise 3
    var facultyList : [Faculty]?
    init(_ n : String) {
        name = n
    }
}

class Student : CampusMember {
    // var academicLevel
    var yearGrad : Int!
    var major : Department!
    var minor : Department?
    
    func major(m : String) {
        if let d = CSUF.departments[m] {
            major = d
            if d.studentList != nil {
                d.studentList?.append(self)
            } else {
                d.studentList = [Student]()
                d.studentList?.append(self)
            }
        } else {
            // Error
        }
    }
}

// Exercise 3 code
enum FacultyType : String {
    case Tenured = "tenured"
    case PartTime = "part_time"
}

class Faculty : CampusMember {
    var type : FacultyType!
    var hiredBy : Department!
    
    func hiredBy(m: String) {
        if let d = CSUF.departments[m] {
            hiredBy = d
            if d.facultyList != nil {
                d.facultyList?.append(self)
            } else {
                d.facultyList = [Faculty]()
                d.facultyList?.append(self)
            }
        } else {
            // Error
        }
    }
}
