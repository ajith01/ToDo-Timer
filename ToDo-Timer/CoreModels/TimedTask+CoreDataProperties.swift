//
//  TimedTask+CoreDataProperties.swift
//  ToDo-Timer
//
//  Created by Arnav Gupta on 2021-12-08.
//
//

import Foundation
import CoreData


extension TimedTask {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<TimedTask> {
        return NSFetchRequest<TimedTask>(entityName: "TimedTask")
    }

    @NSManaged public var name: String?
    @NSManaged public var importance: Int16
    @NSManaged public var createdAt: Date?
    @NSManaged public var timeElapsed: Float

}

extension TimedTask : Identifiable {

}
