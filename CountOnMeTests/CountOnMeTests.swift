//
//  CountOnMeTests.swift
//  CountOnMeTests
//
//  Created by WANDIANGA on 04/03/2020.
//  Copyright © 2020 Vincent Saluzzo. All rights reserved.
//

import XCTest
@testable import CountOnMe

class CountOnMeTests: XCTestCase {
    
    // Tester fonction -> elements, expressionHaveEnoughElement, canAddOperator, expressionHaveResult, resolveOperation()
    
    var calculator : CalculatorCountOnMe!
    
    override func setUp() {
        super.setUp()
        
        calculator = CalculatorCountOnMe()
        
        
    }
    
    func testElements() {
        
        
    }
    
    func testExpressionIsCorrect() {
        // Given_When_Then
        
        // Given
        calculator.expression = "+"
        calculator.expression = "-"
        
        // When
        let result = calculator.expressionIsCorrect
        
        // Then
        XCTAssertFalse(result)
        
    }
    
    func testexpressionHaveEnoughElement() {
        
        let result = calculator.elements.count >= 3
        
        XCTAssertFalse(result)
        
    }
    
    func testCanAddOperator() {
        
        // Given -> Etant donné que expression = +
        calculator.expression = "+"
        calculator.expression = "-"
        
        // When -> Quand.... : Action que l'on veut tester ->  J'ajoute un operateur + en dernier element du tableau
        let result = calculator.canAddOperator
        
        // Then -> Alors... : Situation d'arriver du test -> Ca retourne Faux
        
        XCTAssertFalse(result)
    }
    
    func testexpressionHaveResult() {
        
        let result = calculator.expression.firstIndex(of: "=")
        
        XCTAssertFalse((result != nil))
        
    }
    
    func testValeurOneTableauElement() {
        
        // Tester que la 1ére valeur du tableau Element est un Int
        
        // Given -> Etant donné que le tableau elements n'est pas vide
        
        
        // When -> Quand.... : Je crée un élément dans ce tableau (conversion de type)
        
        let operationsToReduce = calculator.elements
        var left = Int(operationsToReduce[0])!
        
        left = 10
        // Alors cette élément est un entier
        
        XCTAssertTrue(left == 10)
        
    }
    
    func testValeurDeuxTableauElement() {
        
        if calculator.elements.count > 1 {
            // Tester que la 2éme valeur du tableau Element est un String
            
            let operationsToReduce = calculator.elements
            var operand = operationsToReduce[1]
            
            operand = "+"
            operand = "-"
            
            XCTAssertTrue(operand == "+" || operand == "-")
            
        }
        
    }
    
    func testValeurTroisTableauElement() {
        
        if calculator.elements.count > 2 {
            
            let operationsToReduce = calculator.elements
            var right = Int(operationsToReduce[2])!
            
            right = 10
            
            XCTAssertTrue(right == 10)
        }
        
    }
    
    func testAddition() {
        
        if calculator.elements.count >= 3 {
            
            let operationsToReduce = calculator.elements
            var left = Int(operationsToReduce[0])!
            
            left = 10
            
            var operand = operationsToReduce[1]
            
            operand = "+"
            
            var right = Int(operationsToReduce[2])!
            
            right = 10
            
            let result: Int
            switch operand {
            case "+": result = left + right
            default: fatalError("Unknown operator !")
            }
            
            XCTAssertTrue(result == 20)
            
        }
        
    }
    
    
    func testSoustraction() {
        
        if calculator.elements.count >= 3 {
            
            let operationsToReduce = calculator.elements
            var left = Int(operationsToReduce[0])!
            
            left = 20
            
            var operand = operationsToReduce[1]
            
            operand = "-"
            
            var right = Int(operationsToReduce[2])!
            
            right = 10
            
            let result: Int
            switch operand {
            case "-": result = left - right
            default: fatalError("Unknown operator !")
            }
            
            XCTAssertTrue(result == 10)
            
        }
        
    }
    
    func testResolveOperation() {
        
        if calculator.elements.count >= 3 {
            let operationsToReduce = calculator.elements
            var left = Int(operationsToReduce[0])!
             left = 20
            
            let operand = operationsToReduce[1]
            
            var right = Int(operationsToReduce[2])!
            right = 10
            
            let result: Int
            switch operand {
            case "+": result = left + right
            case "-": result = left - right
            default: fatalError("Unknown operator !")
            }
            
            XCTAssertEqual(operand == "+", result == 30)
            XCTAssertEqual(operand == "-", result == 10)
        }
        
    }
    
}


// tester la fonction dropFirst pas besoin de tester fonction swift
// tester la fonction insert

// Tester résultat de l'operation
