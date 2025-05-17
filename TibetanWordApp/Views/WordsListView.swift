import SwiftUI
import CoreData

struct WordsListView: View {
    @Environment(\.managedObjectContext) private var viewContext
    
    // ✅ 搜索字段
    @State private var searchText: String = ""

    // ✅ 使用 FetchRequest 获取所有词条
    @FetchRequest(
            sortDescriptors: [NSSortDescriptor(keyPath: \WordEntity.tibetan, ascending: true)],
            animation: .default)
    private var words: FetchedResults<WordEntity>

    
    var body: some View {
        NavigationView {
            VStack {
                // ✅ 搜索框
                TextField("搜索藏文 / 中文 / 拼音", text: $searchText)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding([.horizontal, .top])

                // ✅ 过滤后的词条
                List {
                    ForEach(filteredWords) { word in
                        WordRow(word: word)
                    }
                }
            }
            .navigationTitle("藏语词汇")
        }
    }
    
    // ✅ 搜索过滤逻辑
        private var filteredWords: [WordEntity] {
            if searchText.isEmpty {
                return Array(words)
            } else {
                return words.filter { word in
                    (word.tibetan.contains(searchText) ?? false) ||
                    (word.transliteration.localizedCaseInsensitiveContains(searchText) ?? false) ||
                    (word.meaningCN.contains(searchText) ?? false)
                }
            }
        }
}
