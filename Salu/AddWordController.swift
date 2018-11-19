//
//  AddWordController.swift
//  Salu
//
//  Created by Sean Casaus on 11/17/18.
//  Copyright © 2018 Sean Casaus. All rights reserved.
//

import UIKit

class AddWordController: UIViewController {
    @IBOutlet weak var wordInput: UITextField!
    var words = WordModel()
    var fStore = FStore()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    @IBAction func AddWord(_ sender: Any) {
        let translatedWord: String = translateWord(defaultWord: wordInput.text!, targetLanguage: "fr")
        fStore.addData(defaultWord: wordInput.text!, targetLanguage: translatedWord, targetWord: "sdfdsf")
    }
    
    func translateWord(defaultWord: String, targetLanguage: String) -> String {
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
            }
        })
        jsonQuery.resume()

        
        
        return "dsfdsf"
    }
}
