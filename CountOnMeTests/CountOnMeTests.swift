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
    
    var calculator : CalculatorCountOnMe!
    
    override func setUp() {
        super.setUp()
        
        calculator = CalculatorCountOnMe()
        
        
    }
    
    func testInitialValueElements() {
        XCTAssertEqual(calculator.elements, ["0"])
        
        calculator.expression = "12 + 4"
        
        XCTAssertEqual(calculator.elements, ["12","+","4"])
    }
    
    func testExpressionIsCorrect() {
       
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
       
        let operationsToReduce = calculator.elements
        var left = Int(operationsToReduce[0])!
        
        left = 10
        // Alors cette élément est un entier
        
        XCTAssertEqual(left, 10)
        
    }
    
    func testValeurDeuxTableauElement() {
        let operationsToReduce = calculator.elements
        var left = Int(operationsToReduce[0])!
        
        left = 10
        
        if operationsToReduce.count >= 1 {
            // Tester que la 2éme valeur du tableau Element est un String
            
            let operationsToReduce = calculator.elements
            var operand = operationsToReduce[1]
            
            operand = "+"
            operand = "-"
            
            XCTAssertTrue(operand == "a" || operand == "b")
            
        } else {
            
            XCTFail("Calculator Element fail")
            
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
    
    func testResolveOperationWhenNotEnoughElement() {
        
        // Given
        
        calculator.expression = "23"
        
        // When
        
       let result = calculator.resolveOperation()
        
        // then
        
        XCTAssertEqual(result, ["23"])
    }
    
    func testResolveOperationWhenEnoughElement() {
        
        // Given
        
        calculator.expression = "12 + 4"
        
        // When
        
         let result = calculator.resolveOperation()
        
        // Then
        
        XCTAssertEqual(result, ["16"])
        
    }
}


