import Foundation
import CoreData

extension WordEntity: Identifiable {
    @nonobjc public class func fetchRequest() -> NSFetchRequest<WordEntity> {
        return NSFetchRequest<WordEntity>(entityName: "WordEntity")
    }

    @NSManaged public var id: UUID?
    @NSManaged public var tibetan: String
    @NSManaged public var transliteration: String
    @NSManaged public var meaningCN: String
    @NSManaged public var meaningEN: String
}
