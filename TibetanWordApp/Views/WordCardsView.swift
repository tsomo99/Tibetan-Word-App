import SwiftUI
import CoreData

struct WordCardsView: View {
    @Environment(\.managedObjectContext) private var viewContext
    @FetchRequest(
        entity: WordEntity.entity(),
        sortDescriptors: []
    ) private var words: FetchedResults<WordEntity>

    var body: some View {
        NavigationView {
            if words.isEmpty {
                Text("暂无词汇数据")
                    .foregroundColor(.gray)
                    .font(.title2)
            } else {
                TabView {
                    ForEach(words) { word in
                        WordCardView(word: word)
                            .padding()
                    }
                }
                .tabViewStyle(PageTabViewStyle(indexDisplayMode: .automatic))
                .navigationTitle("词汇学习")
            }
        }
    }
}
