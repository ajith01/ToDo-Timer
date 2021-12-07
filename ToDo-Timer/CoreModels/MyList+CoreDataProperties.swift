//
//  MyList+CoreDataProperties.swift
//  ToDo-Timer
//
//  Created by Arnav Gupta on 2021-12-08.
//
//

import Foundation
import CoreData


extension MyList {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<MyList> {
        return NSFetchRequest<MyList>(entityName: "MyList")
    }

    @NSManaged public var name: String?

}

extension MyList : Identifiable {

}
