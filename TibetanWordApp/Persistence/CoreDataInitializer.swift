//
//  Untitled.swift
//  TibetanWordApp
//
//  Created by de de on 2025/5/18.
//

//
//  CoreDataInitializer.swift
//  TibetanWordApp
//
//  Created by ChatGPT on 2025/5/17.
//

import Foundation
import CoreData

// MARK: - Codable 结构体（用于解析 JSON）

struct ImportWordBook: Codable {
    let title: String
    let words: [ImportWord]
}

struct ImportWord: Codable {
    let tibetan: String
    let meaningCN: String
}

// MARK: - Core Data 初始化器

class CoreDataInitializer {
    
    static func importWordBooksIfNeeded(context: NSManagedObjectContext) {
        // 防止重复导入
        let request: NSFetchRequest<WordBookEntity> = WordBookEntity.fetchRequest()
        request.fetchLimit = 1
        
        do {
            let count = try context.count(for: request)
            if count > 0 {
                print("📘 已导入数据，跳过初始化。")
                return
            }
        } catch {
            print("❌ 查询失败: \(error)")
            return
        }
        
        // 加载 JSON 文件
        guard let url = Bundle.main.url(forResource: "wordbooks", withExtension: "json"),
              let data = try? Data(contentsOf: url) else {
            print("❌ 无法读取 wordbooks.json")
            return
        }
        
        // 解码 JSON
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .useDefaultKeys
        
        guard let wordBooks = try? decoder.decode([ImportWordBook].self, from: data) else {
            print("❌ JSON 解码失败")
            return
        }
        
        // 导入数据到 Core Data
        for book in wordBooks {
            let wordBook = WordBookEntity(context: context)
            wordBook.id = UUID()
            wordBook.title = book.title
            
            for word in book.words {
                let wordEntity = WordEntity(context: context)
                wordEntity.id = UUID()
                wordEntity.tibetan = word.tibetan
                wordEntity.meaningCN = word.meaningCN
                wordEntity.wordBook = wordBook
            }
        }
        
        do {
            try context.save()
            print("✅ 成功导入词书和词条")
        } catch {
            print("❌ 保存失败: \(error)")
        }
    }
}
