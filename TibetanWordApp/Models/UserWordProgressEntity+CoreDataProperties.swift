//
//  UserWordProgressEntity+CoreDataProperties.swift
//  TibetanWordApp
//
//  Created by de de on 2025/5/18.
//
//

import Foundation
import CoreData


extension UserWordProgressEntity {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<UserWordProgressEntity> {
        return NSFetchRequest<UserWordProgressEntity>(entityName: "UserWordProgressEntity")
    }

    @NSManaged public var id: UUID?
    @NSManaged public var lastReviewed: Date?
    @NSManaged public var reviewCount: Int16
    @NSManaged public var status: String?
    @NSManaged public var user: String?
    @NSManaged public var word: String?

}

extension UserWordProgressEntity : Identifiable {

}
