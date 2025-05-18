struct WordCardView: View {
    var word: WordEntity
    @State private var showMeaning = false

    var body: some View {
        VStack {
            Text(word.tibetan)
                .font(.largeTitle)
            if showMeaning {
                Text(word.meaningCN ?? "")
                Text(word.meaningEN ?? "")
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.yellow.opacity(0.2))
        .cornerRadius(20)
        .onTapGesture {
            withAnimation {
                showMeaning.toggle()
            }
        }
    }
}
