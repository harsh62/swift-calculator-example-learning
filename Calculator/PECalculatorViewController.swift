//
//  PECalculatorViewController.swift
//  Calculator
//
//  Created by Annie Yang on 6/26/17.
//  Copyright © 2017 Annie. All rights reserved.
//

import UIKit

class PECalculatorViewController: UIViewController {

    // Font size Autoshrink
    @IBOutlet weak var display: UILabel!
    
    @IBAction func touchDigit(_ sender: UIButton) {
        let digit = sender.currentTitle!
        if userIsInTheMiddleOfTypingNumber {
            let textCurrentlyInDisplay = display.text!
            display.text = textCurrentlyInDisplay + digit
        } else {
            display.text = digit
            userIsInTheMiddleOfTypingNumber = true
        }
    }
    
    
    //view controller is a UI guy, all calculation should be in model
    @IBAction func performOperation(_ sender: UIButton) {
        if userIsInTheMiddleOfTypingNumber {
            brain.setOperand(displayValue)
            userIsInTheMiddleOfTypingNumber = false
        }
        
        // perform the operation
        // sender.currentTitle
        if let mathematicalSymbol = sender.currentTitle {
            brain.performOperation(mathematicalSymbol)
        }
        
        // update the display if I can
        if let result = brain.result {
            displayValue = result
        }
    }
    
    
    // flag to check if user is typing numbers
    var userIsInTheMiddleOfTypingNumber = false
    
    
    // computed property to convert String to Double
    var displayValue: Double {
        get {
            return Double(display.text!)!
        }
        set {
            display.text = String(newValue)
        }
    }
    

    //model is private to controller
//    private var brain = CalculatorBrainFirst()
//    private var brain = CalculatorBrainSecond()
//    private var brain = CalculatorBrainThird()
//    private var brain = CalculatorBrainFourth()
    private var brain = PECalculatorBrain()
    
    
}














