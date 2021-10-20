//
//  Dsl_Faculty.swift
//
//  Created by James Shen on 10/9/21.
//


class faculty {
    var fObj : Faculty
    var hiredBy : String!
    
    init(_ id : String, _ fn : String, _ ln : String, _ g : Gender) {
        fObj = Faculty(id, fn, ln, g)!
    }
    
    func build() {
        fObj.hiredBy(m: hiredBy)
    }
    
    func type(_ t: FacultyType) -> faculty {
        fObj.type = t
        return self
    }
}

@resultBuilder
class DepartBuilder {
    static func buildBlock(_ components: faculty...) -> [faculty] {
        return components
    }
}

class department {
    var faculties : [faculty]
    
    init(_ n : String, @DepartBuilder f : () -> [faculty]) {
        //
        faculties = f()
        for f in faculties {
            f.hiredBy = n
            f.build()
        }
    }

}
