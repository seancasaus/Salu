//
//  WordCell.swift
//  Salu
//
//  Created by Sean Casaus on 11/17/18.
//  Copyright © 2018 Sean Casaus. All rights reserved.
//

import UIKit

class WordCell: UITableViewCell {
    @IBOutlet weak var wordLabel: UILabel!
    
    func SetWord(word: Word) {
        wordLabel.text = word.defaultWord
    }
}
