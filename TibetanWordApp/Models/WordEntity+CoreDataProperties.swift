//
//  WordEntity+CoreDataProperties.swift
//  TibetanWordApp
//
//  Created by de de on 2025/5/18.
//
//

import Foundation
import CoreData


extension WordEntity {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<WordEntity> {
        return NSFetchRequest<WordEntity>(entityName: "WordEntity")
    }

    @NSManaged public var book: String
    @NSManaged public var id: UUID
    @NSManaged public var meaningCN: String
    @NSManaged public var meaningEN: String
    @NSManaged public var tibetan: String
    @NSManaged public var transliteration: String
    @NSManaged public var wordBook: WordBookEntity

}

extension WordEntity : Identifiable {

}
