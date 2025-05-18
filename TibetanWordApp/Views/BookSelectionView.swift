import SwiftUI
import Foundation
import CoreData

struct BookSelectionView: View {
    @Environment(\.managedObjectContext) var context
    @FetchRequest(entity: WordBookEntity.entity(), sortDescriptors: []) var books: FetchedResults<WordBookEntity>

    var body: some View {
        List {
            ForEach(books) { book in
                NavigationLink(destination: LearningView(book: book)) {
                    Text(book.title)
                }
            }
        }
        .navigationTitle("选择词书")
    }
}
