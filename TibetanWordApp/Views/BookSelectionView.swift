struct BookSelectionView: View {
    @Environment(\.managedObjectContext) var context
    @FetchRequest(entity: WordBook.entity(), sortDescriptors: []) var books: FetchedResults<WordBook>

    var body: some View {
        List {
            ForEach(books) { book in
                NavigationLink(destination: LearningView(book: book)) {
                    Text(book.title ?? "词书")
                }
            }
        }
        .navigationTitle("选择词书")
    }
}
