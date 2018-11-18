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
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    @IBAction func AddWord(_ sender: Any) {
        let tempWord: Word = Word(defaultWord: wordInput.text!, translatedWord: " ", targetLanguage: " ")
        WordModel(word: tempWord)
    }
}
