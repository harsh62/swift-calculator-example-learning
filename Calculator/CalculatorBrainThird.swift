//
//  CalculatorBrainThird.swift
//  Calculator
//
//  Created by Annie Yang on 6/27/17.
//  Copyright © 2017 Annie. All rights reserved.
//

import Foundation

import Foundation

struct CalculatorBrainThird {
    
    private var accumulator: Double?       //5 * = not set
    
    //symbol look up table
    //value can be type: Double, function, closure, ...  ------> Any
    //Swift way: Create a Type rather then Any
    private var operations: Dictionary<String, Any> =
            [
                "π" : Double.pi,
                "e" : M_E,
                "√" : sqrt(4), //(Double) ->Double,
                "+" : { 5.0 + 9.0 }   //(Double, Double) ->Double
        ]
    
        mutating func performOperation(_ symbol: String) {
            if let constant = operations[symbol] {
                accumulator = constant as! Double
            }
    //
    //        switch symbol {
    //        case "π":                       //constant
    //            accumulator = Double.pi
    //        case "√":                       //unary operation
    //            if let operand = accumulator {
    //                accumulator = sqrt(operand)
    //            }
    //        case "±":
    //            if let operand = accumulator {
    //                accumulator = -operand
    //            }
    //        case "+":                       //binary operation
    //            fallthrough
    //
    //        default:
    //            break
    //        }
    
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
