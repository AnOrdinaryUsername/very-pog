//
//  Dsl-Builder.swift
//  
//
//  Created by James Shen on 9/15/21.
//

class student {
    var stObj : Student
    
    init(fn: String, ln: String, g: Gender) {
        stObj = Student(fn: fn, ln: ln, g: g)!
    }
    
    func major(m: String) {
        stObj.major(m: m)
    }
    
    func cwid(_ id: Int) -> student {
        stObj.cwid = id
        return self 
    }
}

@resultBuilder
class DepartmentBuilder {
    static func buildBlock(_ components: student...) -> [student] {
        return [student](components)
    }
}

class department1 {
    var students : [student]
    
    init(_ n: String, @DepartmentBuilder f : ()->[student]) {
        students = f()
        for s in students {
            s.major(m: n)
        }
    }
}
