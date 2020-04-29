//
//  CalculatorBrainFirst.swift
//  Calculator
//
//  Created by Annie Yang on 6/26/17.
//  Copyright © 2017 Annie. All rights reserved.
//

import Foundation

struct CalculatorBrainFirst {
    
    private var accumulator: Double?       //5 * = not set
    
    mutating func performOperation(_ symbol: String) {
        switch symbol {
        case "π":                       //constant
            accumulator = Double.pi
        case "e":                       //constant
            accumulator = M_E
        case "√":                       //unary operation
            if let operand = accumulator {
                accumulator = sqrt(operand)
            }
        case "±":
            if let operand = accumulator {
                accumulator = -operand
            }
        case "+":                       //binary operation
            fallthrough
            
        default:
            break
        }
        
    }
    
    mutating func setOperand(_ operand: Double) {
        accumulator = operand
    }
    
    var result: Double? {    //read-only
        get {
            return accumulator
        }
    }
    
}
