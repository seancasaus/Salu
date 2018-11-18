//
//  WordModel.swift
//  Salu
//
//  Created by Sean Casaus on 11/17/18.
//  Copyright © 2018 Sean Casaus. All rights reserved.
//

import Foundation

class WordModel {
    var words: [Word] = []
    
    init (word: Word) {
        self.words.append(word)
    }
    
    func getWords() -> [Word] {
        return words
    }
}
