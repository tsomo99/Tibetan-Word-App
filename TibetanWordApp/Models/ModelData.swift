import Foundation

final class ModelData {
    static let shared = ModelData()
    
    private(set) var words: [Word] = []

    private init() {
        loadWords()
    }
    
    private func loadWords() {
        guard let url = Bundle.main.url(forResource: "Words100", withExtension: "json") else {
            fatalError("🛑 未找到 Words100.json，请检查资源引用")
        }
        
        do {
            let data = try Data(contentsOf: url)
            let decoder = JSONDecoder()
            var words = try decoder.decode([Word].self, from: data)
            
            // 如果 id 字段为空或无效，生成一个 UUID
            words = words.map { word in
                var wordWithUUID = word
                if wordWithUUID.id.isEmpty {
                    wordWithUUID.id = UUID().uuidString  // 生成一个新的 UUID
                }
                return wordWithUUID
            }
            
            self.words = words
        } catch {
            fatalError("🛑 解析 JSON 失败：\(error)")
        }
    }
}
