//
//  CampusStore.swift
//  ViewAutoLayou_IB
//
//  Created by James Shen on 10/6/21.
//

//import Foundation
import SQLite

//
class Database {
    var conn : Connection!
    
    var studentTbl : Table!
    var fnCol : Expression<String>!
    var lnCol : Expression<String>!
    var cwidCol : Expression<Int>!
    
    init() {
        let rootPath = try! FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: false)
        let dbPath = rootPath.appendingPathComponent("Campus.sqlite").path
        print("Sqlite database location: \(dbPath)")
        
        // Create/open the database connection
        conn = try! Connection(dbPath)
        //
        initialize()
    }
    func initialize() {
        studentTbl = Table("student")
        fnCol = Expression<String>("first_name")
        lnCol = Expression<String>("last_name")
        cwidCol = Expression<Int>("cwid")
        let crTbl = studentTbl.create(ifNotExists: true) { t in
            t.column(fnCol)
            t.column(lnCol)
            t.column(cwidCol)
        }
        try! conn.run(crTbl)
    }
}

// Singleton object
class CampusStore {

    static private var instance : CampusStore!
    var database = Database()
    
    static func get() -> CampusStore {
        if instance == nil {
            instance = CampusStore()
        }
        return instance
    }

    func createStudent(stObj : Student) {
        let conn = database.conn!
        let tbl = database.studentTbl!
        let insStmt = tbl.insert(database.fnCol <- stObj.firstName, database.lnCol <- stObj.lastName, database.cwidCol <- stObj.cwid)
        try! conn.run(insStmt)
    }
}
