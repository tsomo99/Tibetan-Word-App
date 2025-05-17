import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            WordCardsView()
                .tabItem {
                    Label("卡片学习", systemImage: "rectangle.stack.fill")
                }

            WordsListView()
                .tabItem {
                    Label("词汇表", systemImage: "list.bullet")
                }
             
        }
    }
}
