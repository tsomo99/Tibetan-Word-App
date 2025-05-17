import SwiftUI

struct WordCardView: View {
    var word: WordEntity

    @State private var isFlipped = false

    var body: some View {
        ZStack {
            if isFlipped {
                // 背面显示释义
                VStack(spacing: 12) {
                    Text(word.transliteration ?? "")
                        .font(.title2)
                        .foregroundColor(.gray)
                    Text(word.meaningCN ?? "")
                        .font(.title)
                        .bold()
                        .foregroundColor(.primary)
                    Text(word.meaningEN ?? "")
                        .font(.subheadline)
                        .foregroundColor(.secondary)
                }
                .padding()
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .background(Color.yellow.opacity(0.3))
                .cornerRadius(20)
                .shadow(radius: 5)
                .transition(.scale)
            } else {
                // 正面显示藏文
                Text(word.tibetan ?? "")
                    .font(.system(size: 48))
                    .bold()
                    .foregroundColor(.blue)
                    .padding()
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .background(Color.white)
                    .cornerRadius(20)
                    .shadow(radius: 5)
                    .transition(.scale)
            }
        }
        .animation(.spring(), value: isFlipped)
        .onTapGesture {
            withAnimation {
                isFlipped.toggle()
            }
        }
    }
}
