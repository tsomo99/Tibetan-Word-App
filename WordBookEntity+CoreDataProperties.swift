//
//  WordBookEntity+CoreDataProperties.swift
//  TibetanWordApp
//
//  Created by de de on 2025/5/18.
//
//

import Foundation
import CoreData


extension WordBookEntity {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<WordBookEntity> {
        return NSFetchRequest<WordBookEntity>(entityName: "WordBookEntity")
    }

    @NSManaged public var id: UUID?
    @NSManaged public var title: String?
    @NSManaged public var words: NSSet?

}

// MARK: Generated accessors for words
extension WordBookEntity {

    @objc(addWordsObject:)
    @NSManaged public func addToWords(_ value: WordEntity)

    @objc(removeWordsObject:)
    @NSManaged public func removeFromWords(_ value: WordEntity)

    @objc(addWords:)
    @NSManaged public func addToWords(_ values: NSSet)

    @objc(removeWords:)
    @NSManaged public func removeFromWords(_ values: NSSet)

}

extension WordBookEntity : Identifiable {

}
