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
    var cellArray: [WordObj] = []
    
    func getArray(mySnapshot: DataSnapshot) {
 
        for child in mySnapshot.children {
            //print((child as! DataSnapshot).value!)
            var temp = ((child as! DataSnapshot).value!) as! [String : Any]
            let myWordObj: WordObj = WordObj(defaultWord: temp["defaultWord"] as! String, translatedWord: temp["targetWord"] as! String, targetLanguage: temp["targetLanguage"] as! String)
            cellArray.append(myWordObj)
        }
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
    
    
    func translateWord(defaultWord: String, targetLanguage: String) {
        let apiKey = "AIzaSyBzTHFD3rKgOSkxj1EhCh3-brXhf_K4WHw"
        
        let urlAsString: String = "https://translation.googleapis.com/language/translate/v2?key=\(apiKey)&q=\(defaultWord)&target=\(targetLanguage)&format=text"
        
        print(urlAsString)
        let url = URL(string: urlAsString)!
        let urlSession = URLSession.shared
        print("got here")
        let jsonQuery = urlSession.dataTask(with: url, completionHandler: { data, response, error -> Void in
            if (error != nil) {
                print("got here")
                print(error!.localizedDescription)
            } else {
                print("got here")
                let jsonResult = (try! JSONSerialization.jsonObject(with: data!, options: JSONSerialization.ReadingOptions.mutableContainers)) as! NSDictionary
                print(jsonResult)
                let setOne = jsonResult["data"] as! [String : Any]
                print(setOne);
                let translations = setOne["translations"] as! NSArray
                print(translations);
                let translatedContent = translations[0] as! [String : Any]
                let translatedWord = translatedContent["translatedText"]
                print(translatedWord!)
                
                self.addData(defaultWord: defaultWord, targetLanguage: targetLanguage, targetWord: translatedWord as! String)
            }
            
            
        })
        jsonQuery.resume()
    }
}

class JSON {
    struct Words: Codable {
        var defaultWord: String
        var targetLanguage: String
        var targetWord: String
    }
    
    struct DataBasePull: Codable {
        var dictionary: [Words]
    }
    
    func decode(data: Data) -> [Words] {
        if let result = try? JSONDecoder().decode(DataBasePull.self, from: data) {
            return result.dictionary
        }
        return [Words]()
    }
}
