import CoreData

struct WordJSON: Codable {
    let id: String
    let tibetan: String
    let transliteration: String
    let meaningCN: String
    let meaningEN: String
}

struct PersistenceController {
    static let shared = PersistenceController()

    let container: NSPersistentContainer

    init(inMemory: Bool = false) {
        container = NSPersistentContainer(name: "TibetanWordApp")
        if inMemory {
            container.persistentStoreDescriptions.first?.url = URL(fileURLWithPath: "/dev/null")
        }
        container.loadPersistentStores { description, error in
            if let error = error {
                fatalError("Failed to load Core Data store: \(error)")
            }
        }

        let context = container.viewContext
    }
}
