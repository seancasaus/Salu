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
    var words: [Word] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    @IBAction func AddWord(_ sender: Any) {
        let tempWord = Word(defaultWord: wordInput.text!, translatedWord: " ", targetLanguage: " ")
        words.append(tempWord)
    }
}

extension AddWordController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return words.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let word = words[indexPath.row]
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "WordCell") as! WordCell
        cell.SetWord(word: word)
        return cell
    }
}
