//
//  ToDoList.swift
//  ToDo-Timer
//
//  Created by Ajith Kusalakumar on 2021-11-22.
//

import Foundation

struct ToDoListItem: Codable{
    //made these as var so far in case we want to implement changing later
    var taskName:String?
    var taskImportance: Int?
    var date: Date?
    var complete:Bool = false
    //maybe we can add some more variables later
    
    init(taskName:String?,taskImportance:Int?,date:Date?,complete:Bool = false) {
        self.taskName = taskName
        self.taskImportance = taskImportance
        self.date = date
        self.complete = complete
    }
}

enum Importance:Int {
case low = 1
case medium = 2
case high = 3
case veryImportant = 4
    
}
