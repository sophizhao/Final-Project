//
//  ReminderCD+CoreDataProperties.swift
//  Final Project
//
//  Created by Sophia on 6/16/22.
//
//

import Foundation
import CoreData


extension ReminderCD {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<ReminderCD> {
        return NSFetchRequest<ReminderCD>(entityName: "ReminderCD")
    }

    @NSManaged public var frequency: String?
    @NSManaged public var time: Date?

}

extension ReminderCD : Identifiable {

}
