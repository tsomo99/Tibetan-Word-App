//
//  UserEntity+CoreDataProperties.swift
//  TibetanWordApp
//
//  Created by de de on 2025/5/18.
//
//

import Foundation
import CoreData


extension UserEntity {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<UserEntity> {
        return NSFetchRequest<UserEntity>(entityName: "UserEntity")
    }

    @NSManaged public var createdAt: Date
    @NSManaged public var id: UUID
    @NSManaged public var username: String

}

extension UserEntity : Identifiable {

}
