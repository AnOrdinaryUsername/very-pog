//
//  Dsl_Faculty.swift
//
//  Created by James Shen on 10/9/21.
//

class campusmember {
    func build(m: String) {
        // To Be Implemented
    }
}

class faculty : campusmember {
    var fObj : Faculty
    
    init(_ id : String, _ fn : String, _ ln : String, _ g : Gender) {
        fObj = Faculty(id, fn, ln, g)!
    }
    
    override func build(m: String) {
        fObj.hiredBy(m: m)
    }
    
    func type(_ t: FacultyType) -> faculty {
        fObj.type = t
        return self
    }
}

class student : campusmember {
    var sObj : Student
    
    init(_ id : String, _ fn : String, _ ln : String, _ g : Gender) {
        sObj = Student(id, fn, ln, g)!
    }
    
    override func build(m: String) {
        sObj.major(m: m)
    }
    
    func yearGrad(_ y: Int) -> student {
        sObj.yearGrad = y
        return self
    }
}

@resultBuilder
class DepartBuilder {
    static func buildBlock(_ components: campusmember...) -> [campusmember] {
        return components
    }
}

class department {
    var members : [campusmember]
    
    init(_ n : String, @DepartBuilder f : () -> [campusmember]) {
        //
        members = f()
        for f in members {
            f.build(m: n)
        }
    }

}
