//
//  LearningView.swift
//  TibetanWordApp
//
//  Created by de de on 2025/5/18.
//
import SwiftUI
import Foundation
import CoreData

struct LearningView: View {
    var book: WordBookEntity

    var body: some View {
        TabView {
            ForEach(book.wordsArray) { word in
                WordCardView(word: word)
            }
        }
        .tabViewStyle(PageTabViewStyle())
    }
}

