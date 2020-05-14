//
//  CalculatorCountOnMe.swift
//  CountOnMe
//
//  Created by WANDIANGA on 04/03/2020.
//  Copyright © 2020 Vincent Saluzzo. All rights reserved.
//

import Foundation

class CalculatorCountOnMe {
    
    private func notifyErrorDividedByZero() {
        let notificationName = Notification.Name("ErrorDividedByZero")
        let notification = Notification(name: notificationName)
        NotificationCenter.default.post(notification)
        
    }
    
    private func notify() {
        let notificationName = Notification.Name("DataUpdated")
        let notification = Notification(name: notificationName)
        NotificationCenter.default.post(notification)
        
    }
    
    var expression : String = "0" {
        didSet {
            notify()
        }
    }

    
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
    var expressionHaveResult: Bool {
        return expression.firstIndex(of: "=") != nil
    }
    var expressionDividedByZero : Bool {
        return expression.contains("/ 0")
    }
    func tappedNumberButton(numberText: String) {
        if expression == "0" {
            expression = ""
            
        }
        if expressionHaveResult {
            expression = ""
        }
        expression.append(numberText)
    }
    func tappedOperatorButton(with: String) {
        guard expressionIsCorrect else { return }
        guard !expressionHaveResult else { return }
        
        switch with {
        case "+":
            expression.append(" + ")
        case "-":
            expression.append(" - ")
        case "/":
            expression.append(" / ")
        case "x":
            expression.append(" x ")
        default:
            break
        }
    }
    func tappedEqualButton() {
        guard !expressionDividedByZero else { return }
        guard expressionIsCorrect else { return }
        guard expressionHaveEnoughElement else { return }
        
        expression.append(" = \(resolveOperation())")
    }
    func reset() {
        expression.removeAll()
        expression = "0"
    }
//    func ErrorMessage(messageError: String) {
//        // Affichage du message d'erreur en fonction de la variable calculée
//
//        if expressionIsCorrect == false {
//            print("Enter a correct expression !")
//        }
//    }
    func resolveOperation() -> String {
        // Create local copy of operations
        var operationsToReduce = elements
        // Iterate over operations while an operand still here
        while operationsToReduce.count > 1 {
            // Operator index
            var operandIndex = 1
            if let index = operationsToReduce.firstIndex(where: { $0 == "x" || $0 == "/"}) {
                operandIndex = index
            }
            // Assigning numbers
            guard let left = Double(operationsToReduce[operandIndex-1]),
                let right = Double(operationsToReduce[operandIndex+1])
                else { return "Invalid expression" }
            // Calculation
            let operand = operationsToReduce[operandIndex]
            var result: Double
            switch operand {
            case "+": result = left + right
            case "-": result = left - right
            case "/": result = left / right;
            case "x": result = left * right
            default: return "Bad operation"
            }
            // Update operationsToReduce table
            operationsToReduce.remove(at: operandIndex)
            operationsToReduce.remove(at: operandIndex-1)
            operationsToReduce.remove(at: operandIndex-1)
            operationsToReduce.insert(String(result), at: operandIndex-1)
        }
        guard let firstElementOperationToReduce = operationsToReduce.first else {
            return "Missing Result"
        }
        
        // NumberFormatter : firstElementOperationToReduce
        
        
        
        return firstElementOperationToReduce
    }
}








