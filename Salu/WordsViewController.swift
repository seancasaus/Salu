//
//  WordsModel.swift
//  Salu
//
//  Created by Sean Casaus on 11/17/18.
//  Copyright © 2018 Sean Casaus. All rights reserved.
//

import UIKit
import Firebase
//UITableViewDataSource
class WordsController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    @IBOutlet weak var cellLabel: UIView!
    @IBOutlet weak var wordTableView: UITableView!
    var json = JSON()
    var wordModel = WordModel()
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        print(wordModel.cellArray)
        let cell = tableView.dequeueReusableCell(withIdentifier: "WordCell", for: indexPath) as! WordCell
        cell.wordLabel.text = wordModel.cellArray[indexPath.row].translatedWord
        let red = CGFloat(Float(arc4random()) / Float(UINT32_MAX))
        let blue = CGFloat(Float(arc4random()) / Float(UINT32_MAX))
        let green = CGFloat(Float(arc4random()) / Float(UINT32_MAX))
        cell.backgroundColor = UIColor.init(displayP3Red: red, green: green, blue: blue, alpha: 1)
        return cell
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return wordModel.cellArray.count
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        wordModel.cellArray.remove(at: indexPath.row)
        self.wordTableView.reloadData()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        var ref: DatabaseReference!
        
        ref = Database.database().reference()
        _ = ref.observe(DataEventType.value, with: { (snapshot) in
            self.wordModel.getArray(mySnapshot: snapshot)
            self.wordTableView.reloadData()
        })
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if(segue.identifier == "toFlashCard") {
            let selectedIndex: IndexPath = wordTableView.indexPath(for: sender as! UITableViewCell)!
            if let destination: FlashCardViewController = segue.destination as? FlashCardViewController {
                destination.defaultWord = wordModel.cellArray[selectedIndex.row].defaultWord
                destination.targetLanguage = wordModel.cellArray[selectedIndex.row].targetLanguage
                destination.translatedWord = wordModel.cellArray[selectedIndex.row].translatedWord
            }
        }
    }
}

