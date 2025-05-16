import SwiftUI
import CoreData

struct WordListView: View {
    @Environment(\.managedObjectContext) private var viewContext
    @FetchRequest(sortDescriptors: [])
    private var words: FetchedResults<WordEntity>

    var body: some View {
        NavigationView {
            List {
                ForEach(words) { word in
                    WordRow(word: word)
                }
            }
            .navigationTitle("藏语词汇")
        }
    }
}
