//
//  ToDoList.swift
//  ToDo-Timer
//
//  Created by Ajith Kusalakumar on 2021-11-22.
//

import Foundation
class ToDoList: Codable{
    var name:String = "test"
    var toDoListHolder = [ToDoListItem]()  //array of ToDoListItems
    
    
    init(name:String){
        //TO:DO need to figure out a way to add an arry
        self.name = name
    }

}
