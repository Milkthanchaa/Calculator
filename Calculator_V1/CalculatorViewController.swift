//
//  CalculatorViewController.swift
//  Calculator_V1
//
//  Created by Kittinun Chobtham on 16/5/2563 BE.
//  Copyright © 2563 Kittinun Chobtham. All rights reserved.
//

import UIKit
enum Operation:String {
    case Multiply = "*"
    case Divide = "/"
    case Add = "+"
    case Minus = "-"
    case Percent = "%"
    case Change = "+/-"
    case Error = "error"
}
class CalculatorViewController: UIViewController {
    
    @IBOutlet weak var output: UILabel!
    var runningNumber = ""
    var leftValue = ""
    var rightValue = ""
    var result = ""
    var currentOperation: Operation = .Error

    
    @IBAction func allClear(_ sender: UIButton) {
        runningNumber = ""
        leftValue = ""
        rightValue = ""
        result = ""
        currentOperation = .Error
        output.text = "0"
    }
    @IBAction func numbers(_ sender: UIButton) {
       if runningNumber.count <= 8 {
           runningNumber +=  "\(sender.tag-1)"
           output.text = runningNumber
       }

    }
    
    @IBAction func point(_ sender: UIButton)
    { if runningNumber.count <= 0 {
        runningNumber += "0."
        output.text = runningNumber
        
    }
    else if  runningNumber.count <= 7 {
        runningNumber += "."
        output.text = runningNumber
        }
        
        
    }
    
    @IBAction func addSign(_ sender: UIButton) {
        operation(operation: .Add)
    }
    @IBAction func minusSign(_ sender: UIButton) {
        operation(operation: .Minus)
    }
    @IBAction func multiplySign(_ sender: UIButton) {
        operation(operation: .Multiply)
    }
    @IBAction func divideSign(_ sender: UIButton) {
        operation(operation: .Divide)
    }
    @IBAction func percentSign(_ sender: UIButton) {
        operation(operation: .Percent)
    }
    @IBAction func changeSign(_ sender: UIButton) {
        operation(operation: .Change)
        
    }
    
    @IBAction func resultSign(_ sender: UIButton) {
        operation(operation: currentOperation)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        output.text = "0"
    }
    
    func operation(operation: Operation) {
        if currentOperation != .Error {
            if runningNumber != "" {
                rightValue = runningNumber
                runningNumber = ""
                if currentOperation == .Percent {
                    result = "\(Double(leftValue)! / 100 )"
                }
                if currentOperation == .Change {
                    result = "\(Double(leftValue)! * -1 )"
                }
             if currentOperation == .Add {
                 result = "\(Double(leftValue)! + Double(rightValue)!)"
             }
             if currentOperation == .Minus {
                  result = "\(Double(leftValue)! - Double(rightValue)!)"
             }
             if currentOperation == .Divide {
                  result = "\(Double(leftValue)! / Double(rightValue)!)"
             }
             if  currentOperation == .Multiply {
                  result = "\(Double(leftValue)! * Double(rightValue)!)"
             }
                leftValue = result
                output.text = result
            }
            currentOperation = operation
        }
        else {
            leftValue = runningNumber
            runningNumber = ""
            currentOperation = operation
           
            
        }
    }
}

