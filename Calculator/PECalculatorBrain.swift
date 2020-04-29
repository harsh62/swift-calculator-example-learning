//
//  PECalculatorBrain.swift
//  Calculator
//
//  Created by Annie Yang on 6/28/17.
//  Copyright © 2017 Annie. All rights reserved.
//

import Foundation

import Foundation

struct PECalculatorBrain {
    
    private var accumulator: Double?
    
    private enum Operation {
        case constant(Double)
        case unary((Double) -> Double)
        case binary((Double, Double) -> Double)
        case equals         // NO associate value
    }
    
    //make a new Type: Operation
    //purpose: table can hold different value: Double, Function, etc...
    private var operations: Dictionary<String, Operation> = [
        "π" : Operation.constant(Double.pi),
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
            case .binary(let f):
                if accumulator != nil {
                    pendingBinaryOperation = PendingBinaryOperation(function: f, firstOperand: accumulator!)
                    accumulator = nil
                }
            case .equals:
                performPendingBinaryOperation()
            }
        }
    }
    
    // Private mutating func for performing pending binary operations
    mutating func performPendingBinaryOperation() {
        if pendingBinaryOperation != nil && accumulator != nil {
            accumulator = pendingBinaryOperation!.perform(with: accumulator!)   //still need ! even != nil
            pendingBinaryOperation = nil
        }
    }
    
    // Private optional Pending Binary Operation
    private var pendingBinaryOperation: PendingBinaryOperation?
    
    
    //Another nested Type: struct
    //to hold the value: 5 x 5
    private struct PendingBinaryOperation {
        let function: (Double, Double) -> Double
        let firstOperand: Double
        
        func perform(with secondOperand: Double) -> Double {
            return function(firstOperand, secondOperand)
        }
    }
    

    mutating func setOperand(_ operand: Double) {
        accumulator = operand
    }
    
    // return an optional since the accumulator can be not set
    //so can not be Double
    var result: Double? {
        get {
            return accumulator
        }
    }
}
