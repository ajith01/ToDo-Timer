//
//  ToDoItem+CoreDataProperties.swift
//  ToDo-Timer
//
//  Created by Arnav Gupta on 2021-12-08.
//
//

import Foundation
import CoreData


extension ToDoItem {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<ToDoItem> {
        return NSFetchRequest<ToDoItem>(entityName: "ToDoItem")
    }

    @NSManaged public var completed: Bool
    @NSManaged public var createdAt: Date?
    @NSManaged public var importance: Int16
    @NSManaged public var listName: String?
    @NSManaged public var name: String?

}

extension ToDoItem : Identifiable {

}
