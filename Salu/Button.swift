//
//  Button.swift
//  Salu
//
//  Created by Sean Casaus on 10/30/18.
//  Copyright © 2018 Sean Casaus. All rights reserved.
//

import UIKit

class Button: UIButton {

    //button styling
    override func awakeFromNib() {
        super.awakeFromNib()
        layer.borderWidth = 1.0
        layer.borderColor = UIColor.gray.cgColor
        layer.cornerRadius = 8
        layer.opacity = 0.5
    }
}
