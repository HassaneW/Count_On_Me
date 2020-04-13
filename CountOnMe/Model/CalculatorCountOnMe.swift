//
//  CalculatorCountOnMe.swift
//  CountOnMe
//
//  Created by WANDIANGA on 04/03/2020.
//  Copyright © 2020 Vincent Saluzzo. All rights reserved.
//

import Foundation

class CalculatorCountOnMe {
    
    var expression : String = "0"
    
    var elements: [String] {
        return expression.split(separator: " ").map { "\($0)" }
    }
    
    // Error check computed variables
    var expressionIsCorrect: Bool {
        return elements.last != "+" && elements.last != "-" &&  elements.last != "x" &&  elements.last != "/"
    }
    
    var expressionHaveEnoughElement: Bool {
        return elements.count >= 3
    }
    
    var canAddOperator: Bool {
        return elements.last != "+" && elements.last != "-" &&  elements.last != "x" &&  elements.last != "/"
    }
    
    var expressionHaveResult: Bool {
        return expression.firstIndex(of: "=") != nil
    }
    
    func resolveOperation() -> [String] {
        // Create local copy of operations
        var operationsToReduce = elements
        
        // Iterate over operations while an operand still here
        while operationsToReduce.count > 1 {
    
            guard let left = Double(operationsToReduce[0]),
                let right = Double(operationsToReduce[2])
                
                else { preconditionFailure("Invalid expression")}
            let operand = operationsToReduce[1]
            
            var result: Double
            switch operand {
            case "+": result = left + right
            case "-": result = left - right
            case "/": result = left / right
            case "x": result = left * right
            default: fatalError("Unknown operator !")
            }
         
            operationsToReduce = Array(operationsToReduce.dropFirst(3))
            operationsToReduce.insert("\(result)", at: 0)
            
//            if let index = operationsToReduce.firstIndex(where: { $0 == "x" || $0 == "/"}) {
//                print("\(operationsToReduce[index]) ")
//
//                guard let left = Double(operationsToReduce[index-1]),
//                    let right = Double(operationsToReduce[index+1])
//
//                    else { preconditionFailure("Invalid expression")}
//
//                let operand = operationsToReduce[index]
//
//                var result: Double
//                   switch operand {
//                   case "+": result = left + right
//                   case "-": result = left - right
//                   case "/": result = left / right
//                   case "x": result = left * right
//                   default: fatalError("Unknown operator !")
//                   }
//
//                 operationsToReduce.remove(at: index)
//                operationsToReduce.remove(at: index-1)
//                operationsToReduce.remove(at: index-1)
//                operationsToReduce.insert(String(result), at: index-1)
//
//                }
            
        }
        
        return operationsToReduce
    }
    
}








