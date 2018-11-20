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
        fStore.translateWord(defaultWord: wordInput.text!, targetLanguage: "fr")
    }
}
