//
//  Word.swift
//  Salu
//
//  Created by Sean Casaus on 11/17/18.
//  Copyright © 2018 Sean Casaus. All rights reserved.
//

import Foundation

class Word {
    var defaultWord: String
    var translatedWord: String
    var targetLanguage: String
    
    init (defaultWord: String, translatedWord: String, targetLanguage: String) {
        self.defaultWord = defaultWord
        self.translatedWord = translatedWord
        self.targetLanguage = targetLanguage
    }
}
