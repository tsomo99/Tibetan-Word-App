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

        //preloadSampleDataIfNeeded()
        
        let context = container.viewContext
        loadWordsFromJSONIfNeeded(context: context)
    }

    
    private func loadWordsFromJSONIfNeeded(context: NSManagedObjectContext) {
        let request: NSFetchRequest<WordEntity> = WordEntity.fetchRequest()
        if let count = try? context.count(for: request), count > 0 {
            return // 数据已经存在，不重复导入
        }

        guard let url = Bundle.main.url(forResource: "Words100", withExtension: "json"),
              let data = try? Data(contentsOf: url),
              let decoded = try? JSONDecoder().decode([WordJSON].self, from: data) else {
            print("⚠️ 无法读取或解析 words.json")
            return
        }

        for word in decoded {
            let entity = WordEntity(context: context)
            entity.id = UUID(uuidString: word.id) ?? UUID()
            entity.tibetan = word.tibetan
            entity.transliteration = word.transliteration
            entity.meaningCN = word.meaningCN
            entity.meaningEN = word.meaningEN
        }

        do {
            try context.save()
            print("✅ 已从 JSON 成功导入 \(decoded.count) 条词汇")
        } catch {
            print("❌ 保存 Core Data 时出错: \(error)")
        }
    }

}
