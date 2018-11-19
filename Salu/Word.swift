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
    
    init (defaultWord2: String, translatedWord2: String, targetLanguage2: String) {
        self.defaultWord = defaultWord2
        self.translatedWord = translatedWord2
        self.targetLanguage = targetLanguage2
    }
}
