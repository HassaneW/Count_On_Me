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
        return elements.last != "+" && elements.last != "-" && elements.last != "x" && elements.last != "/"
    }
    
    var expressionHaveEnoughElement: Bool {
        return elements.count >= 3
    }
    
    var canAddOperator: Bool {
        return elements.last != "+" && elements.last != "-" && elements.last != "x" && elements.last != "/"
    }
    
    var expressionHaveResult: Bool {
        return expression.firstIndex(of: "=") != nil
    }
    
    var expressionDividedByZero : Bool {
        
        return expression.contains("/ 0")
        
    }
    
    func resolveOperation() -> String {
        // Create local copy of operations
        var operationsToReduce = elements
        
        // Iterate over operations while an operand still here
        while operationsToReduce.count > 1 {
            
            // Trouver index de l'operateur avec lequel on va faire le calcul : Position dans le tableau
            var operandIndex = 1
            
            if let index = operationsToReduce.firstIndex(where: { $0 == "x" || $0 == "/"}) { // Index de l'operateur (Int)
                
                operandIndex = index
                
            }
            
            // Trouver le left, right et l'operateur (valeur)
            
            guard let left = Double(operationsToReduce[operandIndex-1]),
                let right = Double(operationsToReduce[operandIndex+1])
                
                // Remplacer par return
                else { return "Invalid expression" }
            
            
            let operand = operationsToReduce[operandIndex]
            
            // Faire ensuite le calcul
            
            var result: Double
            switch operand {
            case "+": result = left + right
            case "-": result = left - right
            case "/": result = left / right;
            case "x": result = left * right
            //            default: fatalError("Unknown operator !")
            default: return "Mauvaise operation"
            }
            
            // Mettre a jour le tableau
            operationsToReduce.remove(at: operandIndex)
            operationsToReduce.remove(at: operandIndex-1)
            operationsToReduce.remove(at: operandIndex-1)
            operationsToReduce.insert(String(result), at: operandIndex-1)
            
        }
        
        //        let operation = operationsToReduce
        
        guard let premierElementOperation = operationsToReduce.first else {
            return "Mauvaise operation"
            
        }
        
        return premierElementOperation
        
    }
    
}








