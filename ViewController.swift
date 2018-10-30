//
//  ViewController.swift
//  Calculator
//
//  Created by Mohammed Sayerwala on 4/27/18.
//  Copyright © 2018 Mohammed Sayerwala. All rights reserved.
//

import UIKit
enum operation:String {
    case Add = "+"
    case Subtract = "-"
    case Multiply = "*"
    case Divide = "/"
    case NULL = "Null"
}

class ViewController: UIViewController {
    
    @IBOutlet weak var answer: UITextField!
    var runningNumber = ""
    var leftValue = ""
    var rightValue = ""
    var result = ""
    var currentOperation:operation = .NULL
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        answer.text = "0"
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    @IBAction func numberPressed(_ sender: Buttons) {
        if runningNumber.count <= 8{
            runningNumber += "\(sender.tag)"
            answer.text = runningNumber
        }
    }
    
    @IBAction func allClearPressed(_ sender: Buttons) {
        runningNumber = ""
        result = ""
        leftValue = ""
        rightValue = ""
        answer.text = "0"
        currentOperation = .NULL
    }
    
    @IBAction func periodPressed(_ sender: Buttons) {
        if runningNumber.count <= 7 {
            runningNumber +=  "."
            answer.text = runningNumber
        }
    }
    
    @IBAction func addPressed(_ sender: Buttons) {
        operation(operation: .Add)
    }
    
    @IBAction func subPressed(_ sender: Buttons) {
        operation(operation: .Subtract)
    }
    
    @IBAction func mulPressed(_ sender: Buttons) {
        operation(operation: .Multiply)
    }
    
    @IBAction func divPrerssed(_ sender: Buttons) {
        operation(operation: .Divide)
    }
    
    @IBAction func submitPressed(_ sender: Buttons) {
        operation(operation: currentOperation)
    }
    
    
    func operation(operation: operation){
        if currentOperation != .NULL {
            if runningNumber != ""{
                rightValue = runningNumber
                runningNumber = ""
                if currentOperation == .Add{
                    result = "\((Double(leftValue)!  +  Double(rightValue)!))"
                }else if currentOperation == .Subtract{
                    result = "\((Double(leftValue)!  -  Double(rightValue)!))"
                }else if currentOperation == .Multiply{
                    result = "\((Double(leftValue)!  *  Double(rightValue)!))"
                }else if currentOperation == .Divide{
                   result = "\((Double(leftValue)!  /  Double(rightValue)!))"
                }
                leftValue = result
                if (Double(result)?.truncatingRemainder(dividingBy: 1) == 0){
                    result = "\(Int(Double(result)!))"
                }
                    answer.text = result
            }
            currentOperation = operation
        }else{
            leftValue = runningNumber
            runningNumber = ""
            currentOperation = operation
            
        }
    }
}

