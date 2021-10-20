
//
/*
var stObj = Student(fn: "James", ln: "Shen", g: .male)
stObj?.cwid = 7849995
stObj?.major(m: "Computer Science")

stObj = Student(fn: "Chris", ln: "Sampson", g: .male)
stObj?.cwid = 7856995
stObj?.major(m: "Computer Science")

stObj = Student(fn: "Jenny", ln: "Wang", g: .female)
stObj?.cwid = 7849988
stObj?.major(m: "Computer Science")

print("Number of students : \(CSUF.departments["Computer Science"]?.students?.count)")
*/
// Syntax 2
/*
department("Computer Science") {
    var sList = [Student]()
    sList.append(Student(fn: "James", ln: "Shen", g: .male)!)
    sList.append(Student(fn: "Chris", ln: "Sampson", g: .male)!)
    sList.append(Student(fn: "Jenny", ln: "Wang", g: .female)!)
    return sList
}
 */

// Target Syntax 
department1("Computer Science") {
    student(fn: "James", ln: "Shen", g: .male).cwid(7895847)
    //Student(fn: "James", ln: "Shen", g: .male)!.setCWID(7895847) as! Student
    student(fn: "Chris", ln: "Sampson", g: .male).cwid(7563849)
    //Student(fn: "Chris", ln: "Sampson", g: .male)!.setCWID(7563849) as! Student
    student(fn: "Jenny", ln: "Wang", g: .female).cwid(8756678)
    //Student(fn: "Jenny", ln: "Wang", g: .female)!.setCWID(8756678) as! Student
}

print("Number of students : \(CSUF.departments["Computer Science"]?.students?.count)")
