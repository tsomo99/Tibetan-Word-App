import SwiftUI

struct WordRow: View {
    var word: WordEntity

    var body: some View {
        VStack(alignment: .leading) {
            Text(word.tibetan)
                .font(.title)
            Text("拼音: \(word.transliteration)")
                .font(.subheadline)
            Text("中文: \(word.meaningCN)")
                .font(.subheadline)
            Text("英文: \(word.meaningEN)")
                .font(.footnote)
                .foregroundColor(.gray)
        }
        .padding(.vertical, 4)
    }
}
