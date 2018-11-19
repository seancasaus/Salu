//
//  WordModel.swift
//  Salu
//
//  Created by Sean Casaus on 11/17/18.
//  Copyright © 2018 Sean Casaus. All rights reserved.
//

import Foundation
import CoreData
import Firebase

class WordModel {
    var words: [WordObj] = []
    
    init () {
    }
    
    func addWord(defaultName: String, translatedName: String, targetName: String) {
        words.append(WordObj(defaultWord: defaultName, translatedWord: translatedName, targetLanguage: targetName))
    }
    
    func deleteCity(x: Int) {
        words.remove(at: x)
    }
    
    func sizeOfArray() -> Int {
        return words.count
    }
    
}

class WordObj {
    var defaultWord: String
    var translatedWord: String
    var targetLanguage: String
    
    init (defaultWord: String, translatedWord: String, targetLanguage: String) {
        self.defaultWord = defaultWord
        self.translatedWord = translatedWord
        self.targetLanguage = targetLanguage
    }
}


class FStore {
    var ref: DatabaseReference!
    var numOfWords: Int = 0
    
    //defaultName: String, translatedName: String, targetName: String
    func addData(defaultWord: String, targetLanguage: String, targetWord: String) {
        ref = Database.database().reference()
        
        let letters = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789"
        let wordCode: String = String((0...19).map{ _ in letters.randomElement()! })
        
        let key = ref.child(wordCode)
        let dw = key.child("defaultWord")
        dw.setValue(defaultWord)
        let tl = key.child("targetLanguage")
        tl.setValue(targetLanguage)
        let tw = key.child("targetWord")
        tw.setValue(targetWord)
    }
}
