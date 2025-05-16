import Foundation
import CoreData

func loadWordsIfNeeded(context: NSManagedObjectContext) {
    let fetchRequest: NSFetchRequest<WordEntity> = WordEntity.fetchRequest()
    fetchRequest.fetchLimit = 1
    let count = (try? context.count(for: fetchRequest)) ?? 0
    guard count == 0 else { return }

    guard let url = Bundle.main.url(forResource: "Words100", withExtension: "json"),
          let data = try? Data(contentsOf: url),
          let rawWords = try? JSONDecoder().decode([RawWord].self, from: data)
    else {
        print("❌ 解析 JSON 失败")
        return
    }

    for word in rawWords {
        let entity = WordEntity(context: context)
        entity.id = UUID(uuidString: word.id) ?? UUID()
        entity.tibetan = word.tibetan
        entity.transliteration = word.transliteration
        entity.meaningCN = word.meaningCN
        entity.meaningEN = word.meaningEN
       
    }

    do {
        try context.save()
        print("✅ 词库导入成功")
    } catch {
        print("❌ 保存失败：\(error)")
    }
}

struct RawWord: Codable {
    let id: String
    let tibetan: String
    let transliteration: String
    let meaningCN: String
    let meaningEN: String
}
