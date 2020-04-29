//
//  CalculatorBrainFourth.swift
//  Calculator
//
//  Created by Annie Yang on 6/27/17.
//  Copyright © 2017 Annie. All rights reserved.
//

import Foundation

import Foundation

struct CalculatorBrainFourth {
    
    // optional on initialization = not set
    private var accumulator: Double?
    
    //private enum specifying operation types
    // with an associated value: this is good way to working around with MIXED types
    private enum Operation {
        case constant(Double)
        case unary((Double) -> Double)              //funtions are normal types
        case binary((Double, Double) -> Double)
        case equals                                 // NO associate value
    }
    

    //Instead of Any, we make a new Type: Operation
    //Purpose: table can hold different value: Double, Function, etc...
    private var operations: Dictionary<String, Operation> = [
        "π" : Operation.constant(Double.pi),     //have to define associate value when use it
        "e" : Operation.constant(M_E),
        "√" : Operation.unary(sqrt),            //funtions are normal types
        "cos" : Operation.unary(cos),
        "±" : Operation.unary({ -$0 }),
        "×" : Operation.binary({ $0 * $1 }),    //use closure, instead of define a funciton
        "÷" : Operation.binary({ $0 / $1 }),
        "+" : Operation.binary({ $0 + $1 }),
        "−" : Operation.binary({ $0 - $1 }),
        "=" : Operation.equals
    ]
    
    //accumulator is being modified, so mutating
    mutating func performOperation(_ symbol: String) {
        if let operation = operations[symbol]    //look up a symbol in the table
        {
            switch operation {
            case .constant(let value):          //the way to retrieve the associate value
                accumulator = value
            case .unary(let function):
                if accumulator != nil {
                    accumulator = function(accumulator!)
                }
            default:
                break
            }
        }
    }
    
    
    // mark method as mutating in order to assign to property
    //change the value of property: copy when write
    mutating func setOperand(_ operand: Double) {
        accumulator = operand
    }
    
    // return an optional since the accumulator can be not set
    //so can not be Double
    var result: Double? {      //getResult() ----> not swift style
        get {
            return accumulator
        }
    }
    
}
