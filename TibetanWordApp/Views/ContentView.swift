import SwiftUI

struct ContentView: View {
    @State private var query = ""
    private var allWords = ModelData.shared.words
    
    // 过滤后的可搜结果
    private var filtered: [Word] {
        if query.isEmpty { return allWords }
        return allWords.filter { word in
            word.tibetan.contains(query) ||
            word.meaningCN.contains(query) ||
            (word.transliteration?.contains(query) ?? false)
        }
    }
    
    var body: some View {
        NavigationStack {
            List(filtered) { w in
                VStack(alignment: .leading, spacing: 4) {
                    Text(w.tibetan)
                        .font(.title3)
                    Text(w.meaningCN)
                        .font(.subheadline)
                        .foregroundColor(.secondary)
                }
                .padding(.vertical, 4)
            }
            .navigationTitle("藏语 100 词")
            .searchable(text: $query, prompt: "输入藏文 / 拼音 / 释义")
        }
    }
}

#Preview { ContentView() }
