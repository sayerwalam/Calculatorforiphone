//
//  Buttons.swift
//  Calculator
//
//  Created by Mohammed Sayerwala on 4/30/18.
//  Copyright © 2018 Mohammed Sayerwala. All rights reserved.
//

import UIKit
@IBDesignable
class Buttons: UIButton {

    @IBInspectable var button:Bool = false {
        didSet {
            if button {
                //layer.cornerRadius = frame.height / 2
                layer.cornerRadius = 10
                layer.borderWidth = 1
            }
        }
    }
    
    override func prepareForInterfaceBuilder() {
        if button {
            //layer.cornerRadius = frame.height / 2
            layer.cornerRadius = 10
            layer.borderWidth = 1
        }
    }

}
