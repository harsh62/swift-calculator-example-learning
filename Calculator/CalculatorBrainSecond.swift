//
//  CalculatorBrainSecond.swift
//  Calculator
//
//  Created by Annie Yang on 6/26/17.
//  Copyright © 2017 Annie. All rights reserved.
//

import Foundation

import Foundation

struct CalculatorBrainSecond {
    
    private var accumulator: Double?       //5 * = not set
    
    //symbol look up table
    private var operations: Dictionary<String, Double> =
    [
        "π" : Double.pi,
        "e" : M_E
    ]
    
    mutating func performOperation(_ symbol: String) {
        if let constant = operations[symbol] {
            accumulator = constant
        }
    }
    
//    private var operations: Dictionary<String, Any> =
//        [
//            "π" : Double.pi,
//            "e" : M_E,
//            "√" : sqrt,
//            "±" : ,
//    ]
//    
//    mutating func performOperation(_ symbol: String) {
//        if let constant = operations[symbol] {
//            accumulator = constant
//        }
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
        
//    }
    
    mutating func setOperand(_ operand: Double) {
        accumulator = operand
    }
    
    var result: Double? {    //read-only
        get {
            return accumulator
        }
    }
    
    
}
