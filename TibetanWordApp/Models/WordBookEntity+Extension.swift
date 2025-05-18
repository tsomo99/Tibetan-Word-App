//
//  WordBookEntity+Extension.swift
//  TibetanWordApp
//
//  Created by de de on 2025/5/18.
//

import Foundation

extension WordBookEntity {
    var wordsArray: [WordEntity] {
        let set = words as? Set<WordEntity> ?? []
        return set.sorted(by: { (a, b) in
            (a.tibetan)  < (b.tibetan)
        })
    }
}
