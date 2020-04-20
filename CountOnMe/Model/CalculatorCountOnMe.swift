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
    
    
    var expressionDividedByZero :  Bool {
        
        print(expression)
        
        // On veut verifier que diviser et 0 sont l'un à la suite de l'autre
        // Dans un string trouver ce qu'on veut trouver
        // Verifier une expression sui se compose de / 0
        
       
        // Retrouver une sequence dans un tableau
//        var tableau = ["Z","/","0","R"]
//
//        var positionDivision = 0
//        var positionZero = 0
//        var currentIndex1 = 0
//        var currentIndex2 = 2
//
//
//        for item in tableau {
//
//            positionZero += 1
//            positionDivision += 1
//
//            if item == "/" {
//
//                currentIndex1 = positionDivision-1
//
//                if item == "0" {
//
//                    currentIndex2 = positionZero-1
//                }
//            }
//
//            if currentIndex2 == currentIndex1 + 1 {
//
//                print("OK")
//            }
//        }
//
//        print(currentIndex1)
//        print(currentIndex2)
        
        return true
        
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
            //            preconditionFailure("Invalid expression"
            
            //            if right == 0.0 {
            //
            //                operationsToReduce = ["Operation Impossible, changer le 0"]
            //            }
            
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
        
        
        
        
        
        //        return operationsToReduce
    }
    
    //    func testEqual() -> String {
    //
    //        let operation = resolveOperation()
    //
    //        guard let premierElementOperation = operation.first else {
    //            return "Mauvaise operation"
    //
    //        }
    //
    //        return premierElementOperation
    //        }
    
    //           let operation = calculator.resolveOperation()
    //
    //           textView.text.append(" = \(operation.first!)")
    //           calculator.expression = textView.text
    
    
    
}








