//
//  Dsl.swift
//  
//
//  Created by James Shen on 9/15/21.
//

class department {
    var students : [Student]
    
    init(_ n: String, f : ()->[Student]) {
        students = f()
        for s in students {
            s.major(m: n)
        }
    }
}
