//
//  AddWordController.swift
//  Salu
//
//  Created by Sean Casaus on 11/17/18.
//  Copyright © 2018 Sean Casaus. All rights reserved.
//

import UIKit

class AddWordController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    @IBOutlet weak var wordInput: UITextField!
    @IBOutlet weak var selectTranslateLanguage: UIPickerView!
    var words = WordModel()
    var fStore = FStore()
    var languages = ["Spanish", "German", "French", "Portuguese", "Italian"]
    var currentRow: Int = 0
    var languagesAbv = ["es", "de", "fr", "pt", "it"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return languages.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return languages[row]
    }
    
    // Capture the picker view selection
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        // This method is triggered whenever the user makes a change to the picker selection.
        // The parameter named row and component represents what was selected.
        currentRow = row
    }

    @IBAction func AddWord(_ sender: Any) {
        let targetLn: String = languagesAbv[currentRow]
        fStore.translateWord(defaultWord: wordInput.text!, targetLanguage: targetLn)
    }
}
